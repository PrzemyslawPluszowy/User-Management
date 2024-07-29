import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:user_management/src/entity/group_entity.dart';
import 'package:user_management/src/entity/user_entity.dart';
import 'package:user_management/src/entity/user_group_entity.dart';
import 'package:user_management/src/models/group_model.dart';
import 'package:user_management/src/models/user_model.dart';

part 'drift_repository.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [
    UserEntity,
    UserGroupEntity,
    GroupEntity,
  ],
)
@DriftDatabase(
  tables: [
    UserEntity,
    UserGroupEntity,
    GroupEntity,
  ],
)
class DriftRepository extends _$DriftRepository {
  DriftRepository({LazyDatabase? lazyDb})
      : super(
          lazyDb ?? _openConnection(),
        );

  @override
  int get schemaVersion => 1;

  ///
  /// Users CRUD
  ///
  Future<int> insertUser(UserEntityCompanion user) =>
      into(userEntity).insert(user);
  Future<bool> updateUser(UserEntityCompanion user) =>
      update(userEntity).replace(user);
  Future<int> deleteUser(String uid) =>
      (delete(userEntity)..where((tbl) => tbl.uid.equals(uid))).go();

  Future<UserModel?> getUserById(String uid) async {
    final userRow = await (select(userEntity)
          ..where((tbl) => tbl.uid.equals(uid)))
        .getSingleOrNull();
    if (userRow == null) return null;

    final groups = await getUserGroups(uid);
    return UserModel(
      uid: userRow.uid,
      name: userRow.name,
      surName: userRow.surName,
      city: userRow.city,
      houseNumber: userRow.houseNumber,
      postalCode: userRow.postalCode,
      createdAt: userRow.createdAt,
      updatedAt: userRow.updatedAt,
      street: userRow.street,
      flatNumber: userRow.flatNumber,
      groups: groups,
    );
  }

  Future<List<UserModel>> getAllUsersWithGroups() async {
    final userRows = await select(userEntity).get();
    final userModels = await Future.wait(
      userRows.map((userRow) async {
        final groups = await getUserGroups(userRow.uid);
        return UserModel(
          uid: userRow.uid,
          name: userRow.name,
          surName: userRow.surName,
          city: userRow.city,
          houseNumber: userRow.houseNumber,
          postalCode: userRow.postalCode,
          createdAt: userRow.createdAt,
          updatedAt: userRow.updatedAt,
          street: userRow.street,
          flatNumber: userRow.flatNumber,
          groups: groups,
        );
      }).toList(),
    );
    return userModels;
  }

  Future<List<UserModel>> getAllUsersOutsideGroup(
    String groupUid,
  ) async {
    final query = select(userEntity).join([
      leftOuterJoin(
        userGroupEntity,
        userGroupEntity.userId.equalsExp(userEntity.uid) &
            userGroupEntity.groupId.equals(groupUid),
      ),
    ])
      ..where(userGroupEntity.groupId.isNull());

    final userRows = await query.get();
    final userModels = await Future.wait(
      userRows.map((userRow) async {
        final groups = await getUserGroups(userRow.readTable(userEntity).uid);
        return UserModel(
          uid: userRow.readTable(userEntity).uid,
          name: userRow.readTable(userEntity).name,
          surName: userRow.readTable(userEntity).surName,
          city: userRow.readTable(userEntity).city,
          houseNumber: userRow.readTable(userEntity).houseNumber,
          postalCode: userRow.readTable(userEntity).postalCode,
          createdAt: userRow.readTable(userEntity).createdAt,
          updatedAt: userRow.readTable(userEntity).updatedAt,
          street: userRow.readTable(userEntity).street,
          flatNumber: userRow.readTable(userEntity).flatNumber,
          groups: groups,
        );
      }).toList(),
    );
    return userModels;
  }

  Future<List<UserModel>> getAllUsersInGroup(
    String groupUid,
  ) async {
    final query = select(userEntity).join([
      innerJoin(
        userGroupEntity,
        userGroupEntity.userId.equalsExp(userEntity.uid),
      ),
      innerJoin(
        groupEntity,
        groupEntity.uid.equalsExp(userGroupEntity.groupId),
      ),
    ])
      ..where(groupEntity.uid.equals(groupUid));

    final userRows = await query.get();
    final userModels = await Future.wait(
      userRows.map((userRow) async {
        final groups = await getUserGroups(userRow.readTable(userEntity).uid);
        return UserModel(
          uid: userRow.readTable(userEntity).uid,
          name: userRow.readTable(userEntity).name,
          surName: userRow.readTable(userEntity).surName,
          city: userRow.readTable(userEntity).city,
          houseNumber: userRow.readTable(userEntity).houseNumber,
          postalCode: userRow.readTable(userEntity).postalCode,
          createdAt: userRow.readTable(userEntity).createdAt,
          updatedAt: userRow.readTable(userEntity).updatedAt,
          street: userRow.readTable(userEntity).street,
          flatNumber: userRow.readTable(userEntity).flatNumber,
          groups: groups,
        );
      }).toList(),
    );
    return userModels;
  }

  ///
  /// Groups CRUD
  ///
  Future<int> insertGroup(GroupEntityCompanion group) =>
      into(groupEntity).insert(group);
  Future<bool> updateGroup(GroupEntityCompanion group) =>
      update(groupEntity).replace(group);

  Future<List<GroupEntityData>> getGroups() async {
    final groupRows = await select(groupEntity).get();
    final groupModels = groupRows.map((groupRow) {
      return GroupEntityData(
        uid: groupRow.uid,
        name: groupRow.name,
        description: groupRow.description,
        createdAt: groupRow.createdAt,
        updatedAt: groupRow.updatedAt,
      );
    }).toList();

    return groupModels;
  }

  Future<int> deleteGroup(String uid) =>
      (delete(groupEntity)..where((tbl) => tbl.uid.equals(uid))).go();
  Future<GroupModel?> getGroupById(String uid) =>
      (select(groupEntity)..where((tbl) => tbl.uid.equals(uid)))
          .getSingleOrNull()
          .then((groupRow) {
        if (groupRow == null) return null;
        return GroupModel(
          uid: groupRow.uid,
          name: groupRow.name,
          description: groupRow.description,
          createdAt: groupRow.createdAt,
          updatedAt: groupRow.updatedAt,
        );
      });

  ///
  /// User-Group Association
  ///
  Future<void> assignUserToGroup(String userId, String groupId) {
    return into(userGroupEntity).insert(
      UserGroupEntityCompanion(
        userId: Value(userId),
        groupId: Value(groupId),
      ),
    );
  }

  Future<void> removeUserFromGroup(String userId, String groupId) {
    return (delete(userGroupEntity)
          ..where(
            (tbl) => tbl.userId.equals(userId) & tbl.groupId.equals(groupId),
          ))
        .go();
  }

  Future<List<GroupModel>> getUserGroups(String userId) async {
    final query = select(userGroupEntity).join([
      innerJoin(
        groupEntity,
        groupEntity.uid.equalsExp(userGroupEntity.groupId),
      ),
    ])
      ..where(userGroupEntity.userId.equals(userId));

    final result = await query.map((row) {
      return GroupModel(
        uid: row.readTable(groupEntity).uid,
        name: row.readTable(groupEntity).name,
        description: row.readTable(groupEntity).description,
        createdAt: row.readTable(groupEntity).createdAt,
        updatedAt: row.readTable(groupEntity).updatedAt,
      );
    }).get();

    return result;
  }
}
