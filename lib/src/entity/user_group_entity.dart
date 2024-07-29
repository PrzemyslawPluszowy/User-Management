import 'package:drift/drift.dart';
import 'package:user_management/src/entity/group_entity.dart';
import 'package:user_management/src/entity/user_entity.dart';

class UserGroupEntity extends Table {
  TextColumn get userId => text().references(UserEntity, #uid)();
  TextColumn get groupId => text().references(GroupEntity, #uid)();

  @override
  Set<Column> get primaryKey => {userId, groupId};
}
