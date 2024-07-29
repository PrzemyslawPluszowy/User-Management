import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_management/main_export.dart';
import 'package:user_management/src/data/local/drift_repository.dart';
import 'package:user_management/src/models/group_model.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/services/group_service.dart';
import 'package:user_management/src/services/users_service.dart';

class UserModelFactory {
  static UserModel create({
    required String uid,
    String name = 'name',
    String surName = 'surname',
    String city = 'city',
    DateTime? createdAt,
    String houseNumber = '23a',
    String postalCode = '32-985',
  }) {
    return UserModel(
      uid: uid,
      name: name,
      surName: surName,
      city: city,
      createdAt: createdAt ?? DateTime(2021, 10, 10),
      houseNumber: houseNumber,
      postalCode: postalCode,
    );
  }
}

///This test check flow with userService and groupService
/// and verify with driftRepository CRUD operation on localdb

void main() {
  late DriftRepository drift;
  late UserService userService;
  late GroupService groupService;

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    drift = DriftRepository(
      lazyDb: LazyDatabase(() async {
        return NativeDatabase.memory();
      }),
    );
    userService = UserService(driftDb: drift);
    groupService = GroupService(driftDb: drift, userService: userService);
  });

  tearDown(() async {
    await drift.close();
  });

  // Test: Create users and verify
  test('users can be created', () async {
    final mockUser1 = UserModelFactory.create(uid: '1');
    final mockUser2 = UserModelFactory.create(uid: '2');

    await userService.createUser(newUser: mockUser1);
    await userService.createUser(newUser: mockUser2);

    final writtenUser1 = await drift.getUserById(mockUser1.uid);
    final writtenUser2 = await drift.getUserById(mockUser2.uid);

    expect(writtenUser1, mockUser1);
    expect(writtenUser2, mockUser2);
  });

  // Test: Retrieve all users
  test('retrieve all users', () async {
    final mockUser1 = UserModelFactory.create(uid: '1');
    final mockUser2 = UserModelFactory.create(uid: '2');

    await userService.createUser(newUser: mockUser1);
    await userService.createUser(newUser: mockUser2);

    final allUsers = await userService.getAllUsersWithGroup();
    expect(allUsers.length, 2);
  });

  // Test: Add and retrieve groups
  test('add and retrieve groups', () async {
    final groupMock = GroupModel(
      uid: '1',
      name: 'group',
      description: 'test',
      createdAt: DateTime(2021, 10, 10),
    );

    await groupService.addGroup(newGroup: groupMock);
    final allGroups = await groupService.getGroups();

    expect(allGroups.length, 1);
    expect(allGroups, [groupMock]);
  });

  // Test: Add users to group
  test('add users to group', () async {
    final mockUser1 = UserModelFactory.create(uid: '1');
    final mockUser2 = UserModelFactory.create(uid: '2');

    await userService.createUser(newUser: mockUser1);
    await userService.createUser(newUser: mockUser2);

    final allUsers = await userService.getAllUsersWithGroup();

    final groupMock = GroupModel(
      uid: '1',
      name: 'group',
      description: 'test',
      createdAt: DateTime(2021, 10, 10),
    );

    await groupService.addGroup(newGroup: groupMock);
    await groupService.addUsersToGroup(groupMock, allUsers);

    final usersInGroup =
        await userService.getAllUsersOutsideGroup(groupMock.uid);
    expect(usersInGroup.length, 0);

    final userOutsideGroup = await userService.getAllUsersWithGroup();
    expect(userOutsideGroup.length, 2);

    final matcher = containsAllInOrder([
      mockUser1.copyWith(groups: [groupMock]),
      mockUser2.copyWith(groups: [groupMock]),
    ]);
    expect(userOutsideGroup, matcher);
  });

  // Test: Remove user from group
  test('remove user from group', () async {
    final mockUser1 = UserModelFactory.create(uid: '1');
    final mockUser2 = UserModelFactory.create(uid: '2');

    await userService.createUser(newUser: mockUser1);
    await userService.createUser(newUser: mockUser2);

    final allUsers = await userService.getAllUsersWithGroup();

    final groupMock = GroupModel(
      uid: '1',
      name: 'group',
      description: 'test',
      createdAt: DateTime(2021, 10, 10),
    );

    await groupService.addGroup(newGroup: groupMock);
    await groupService.addUsersToGroup(groupMock, allUsers);

    await groupService.removeUserFromGroup(mockUser2.uid, groupMock.uid);

    final userOutsideGroup2 =
        await userService.getAllUsersInGroup(groupMock.uid);
    expect(userOutsideGroup2.length, 1);
    expect(userOutsideGroup2, [
      mockUser1.copyWith(groups: [groupMock]),
    ]);
  });

  // Test: Edit group details
  test('edit group details', () async {
    final groupMock = GroupModel(
      uid: '1',
      name: 'group',
      description: 'test',
      createdAt: DateTime(2021, 10, 10),
    );

    await groupService.addGroup(newGroup: groupMock);

    await groupService.editGroup(
      editedGroup:
          groupMock.copyWith(name: 'newName', description: 'newDescription'),
    );

    final allGroups = await groupService.getGroups();
    expect(allGroups.length, 1);
    expect(
      allGroups,
      [groupMock.copyWith(name: 'newName', description: 'newDescription')],
    );
  });

  // Test: Delete group
  test('delete group', () async {
    final groupMock = GroupModel(
      uid: '1',
      name: 'group',
      description: 'test',
      createdAt: DateTime(2021, 10, 10),
    );

    await groupService.addGroup(newGroup: groupMock);
    await groupService.deleteGroup(groupMock);

    final allGroups = await groupService.getGroups();
    expect(allGroups.length, 0);

    final userOutsideGroup =
        await userService.getAllUsersInGroup(groupMock.uid);
    expect(userOutsideGroup.length, 0);
  });

  // Test: Delete user
  test('delete user', () async {
    final mockUser1 = UserModelFactory.create(uid: '1');
    final mockUser2 = UserModelFactory.create(uid: '2');

    await userService.createUser(newUser: mockUser1);
    await userService.createUser(newUser: mockUser2);

    await userService.deleteUser(userId: mockUser1.uid);

    final allUsers = await userService.getAllUsersWithGroup();
    expect(allUsers.length, 1);
    expect(allUsers, [mockUser2.copyWith(groups: [])]);
  });

  // Test: Edit user details
  test('edit user details and delete', () async {
    final mockUser = UserModelFactory.create(uid: '2');

    await userService.createUser(newUser: mockUser);

    await userService.editUser(
      editedUser: mockUser.copyWith(
        name: 'newName',
        surName: 'newSurname',
        city: 'newCity',
        houseNumber: 'newHouseNumber',
        postalCode: 'newPostalCode',
      ),
    );

    final allUsers = await userService.getAllUsersWithGroup();
    expect(allUsers.length, 1);
    expect(allUsers, [
      mockUser.copyWith(
        name: 'newName',
        surName: 'newSurname',
        city: 'newCity',
        houseNumber: 'newHouseNumber',
        postalCode: 'newPostalCode',
        groups: [],
      ),
    ]);

    await userService.deleteUser(userId: mockUser.uid);
    final allUsers2 = await userService.getAllUsersWithGroup();
    expect(allUsers2.length, 0);
  });

  // Test: get group in user
  test('get group in user', () async {
    final mockUser1 = UserModelFactory.create(uid: '1');
    final mockUser2 = UserModelFactory.create(uid: '2');

    await userService.createUser(newUser: mockUser1);
    await userService.createUser(newUser: mockUser2);

    final allUsers = await userService.getAllUsersWithGroup();
    expect(allUsers.length, 2);

    final groupMock = GroupModel(
      uid: '1',
      name: 'group',
      description: 'test',
      createdAt: DateTime(2021, 10, 10),
    );

    await groupService.addGroup(newGroup: groupMock);
    await groupService.addUsersToGroup(groupMock, allUsers);

    final usersInGroup = await userService.getAllUsersInGroup(groupMock.uid);
    expect(usersInGroup.length, 2);
    expect(usersInGroup, [
      mockUser1.copyWith(groups: [groupMock]),
      mockUser2.copyWith(groups: [groupMock]),
    ]);
    final userGroups = await drift.getUserGroups(mockUser1.uid);
    expect(userGroups.length, 1);
    expect(userGroups, [groupMock]);
  });
}
