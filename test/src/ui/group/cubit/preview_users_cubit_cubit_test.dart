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
import 'package:user_management/src/ui/group/cubit/preview_users_cubit_cubit.dart';

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
  late PreviewUsersCubitCubit previeCubit;
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
    previeCubit = PreviewUsersCubitCubit(groupService: groupService);
    await drift.insertUser(mockUser.toEntity());
    await drift.insertGroup(mockGroup.toEntity());
  });

  tearDown(() async {
    await drift.close();
  });

  blocTest<PreviewUsersCubitCubit, PreviewUsersCubitState>(
    'on select in service lisetning stream',
    build: () => previeCubit,
    act: (_) {
      groupService.selectGroup(mockGroup);
    },
    expect: () => [
      const PreviewUsersCubitState.loading(),
      PreviewUsersCubitState.success(
        users: [],
        group: mockGroup,
      ),
    ],
  );

  blocTest<PreviewUsersCubitCubit, PreviewUsersCubitState>(
    'on select in service lisetning stream with user',
    build: () => previeCubit,
    act: (_) async {
      await drift.assignUserToGroup(mockUser.uid, mockGroup.uid);
      await groupService.selectGroup(mockGroup);
    },
    expect: () => [
      const PreviewUsersCubitState.loading(),
      PreviewUsersCubitState.success(
        users: [
          mockUser.copyWith(
            groups: [mockGroup],
          ),
        ],
        group: mockGroup,
      ),
    ],
  );
}
