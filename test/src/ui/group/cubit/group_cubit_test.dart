import 'package:bloc_test/bloc_test.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_management/main_export.dart';
import 'package:user_management/src/data/local/drift_repository.dart';
import 'package:user_management/src/models/group_model.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/services/group_service.dart';
import 'package:user_management/src/services/users_service.dart';
import 'package:user_management/src/ui/group/cubit/group_cubit.dart';

final mockGroup = GroupModel(
  uid: '1',
  name: 'group1',
  createdAt: DateTime(2024, 6, 29),
  description: 'group1 description',
);
final mockUser = UserModel(
  uid: '1',
  name: 'name',
  surName: 'surname',
  city: 'city',
  createdAt: DateTime(2021, 10, 10),
  houseNumber: '23a',
  postalCode: '32-985',
);
void main() {
  late DriftRepository drift;
  late GroupCubit groupCubit;
  late GroupService groupService;
  late UserService userService;

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    drift = DriftRepository(
      lazyDb: LazyDatabase(() async {
        return NativeDatabase.memory();
      }),
    );
    userService = UserService(driftDb: drift);
    groupService = GroupService(driftDb: drift, userService: userService);
    groupCubit = GroupCubit(groupService: groupService);
    await drift.insertUser(mockUser.toEntity());
    await drift.insertGroup(mockGroup.toEntity());
  });

  tearDown(() async {
    await drift.close();
  });

  blocTest<GroupCubit, GroupState>(
    'fetch groups and expect loading and loaded states',
    build: () => groupCubit,
    act: (cubit) => cubit.fetchGroups(),
    expect: () => [
      const GroupState.loading(),
      GroupState.success([mockGroup]),
    ],
  );

  blocTest<GroupCubit, GroupState>(
    'search group by name and expect filtered list',
    build: () => groupCubit,
    act: (cubit) async {
      await cubit.fetchGroups();
      cubit
        ..searchGroup('cantSearch')
        ..searchGroup('')
        ..searchGroup('group1');
    },
    expect: () => [
      const GroupState.loading(),
      GroupState.success([mockGroup]),
      const GroupState.success([]),
      GroupState.success([mockGroup]),
    ],
  );
  blocTest<GroupCubit, GroupState>(
    'add user to group',
    build: () => groupCubit,
    act: (cubit) async {
      await cubit.fetchGroups();
      await cubit.addUsersToGroup(
        group: mockGroup,
        users: [mockUser],
      );
    },
    expect: () => [
      const GroupState.loading(),
      GroupState.success([mockGroup]),
      const GroupState.loading(),
      GroupState.success([mockGroup]),
    ],
  );
  blocTest<GroupCubit, GroupState>(
    'delete group',
    build: () => groupCubit,
    act: (cubit) async {
      await cubit.fetchGroups();
      await cubit.deleteGroup(mockGroup);
    },
    expect: () => [
      const GroupState.loading(),
      GroupState.success([mockGroup]),
      const GroupState.loading(),
      const GroupState.success([]),
    ],
  );

  test(
      '''selectGroup , fetch user then select then emit new records in services(this is use in previe cubit)''',
      () async {
    final rx = groupService.selectedGroupPreview;
    await groupCubit.fetchGroups();
    await drift.assignUserToGroup(mockUser.uid, mockGroup.uid);
    await groupCubit.selectGroup(mockGroup);

    expect(
      rx.stream,
      emitsInOrder([
        (null, null, true),
        isA<(GroupModel, List<UserModel>, bool)>()
            .having(
              (record) => record.$1,
              'Group',
              isA<GroupModel>()
                  .having(
                    (record) => record.uid,
                    'uid',
                    '1',
                  )
                  .having(
                    (group) => group.name,
                    'name',
                    'group1',
                  )
                  .having(
                    (group) => group.createdAt,
                    'createdAt',
                    DateTime(2024, 6, 29),
                  )
                  .having(
                    (group) => group.description,
                    'description',
                    'group1 description',
                  ),
            )
            .having(
              (record) => record.$2,
              'Users',
              isA<List<UserModel>>()
                  .having(
                    (record) => record[0].uid,
                    'uid',
                    '1',
                  )
                  .having(
                    (record) => record[0].name,
                    'name',
                    'name',
                  )
                  .having(
                    (record) => record[0].surName,
                    'surName',
                    'surname',
                  )
                  .having(
                    (record) => record[0].city,
                    'city',
                    'city',
                  )
                  .having(
                    (record) => record[0].createdAt,
                    'createdAt',
                    DateTime(2021, 10, 10),
                  )
                  .having(
                    (record) => record[0].houseNumber,
                    'houseNumber',
                    '23a',
                  )
                  .having(
                    (record) => record[0].postalCode,
                    'postalCode',
                    '32-985',
                  ),
            )
            .having(
              (record) => record.$3,
              'item3',
              false,
            ),
      ]),
    );
  });
}
