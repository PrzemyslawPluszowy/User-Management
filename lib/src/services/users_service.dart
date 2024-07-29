import 'package:user_management/main.dart';
import 'package:user_management/src/data/local/drift_repository.dart';
import 'package:user_management/src/exceptions/custom_exceptions.dart';
import 'package:user_management/src/models/user_model.dart';

class UserService {
  UserService({required this.driftDb});
  final DriftRepository driftDb;

  Future<void> createUser({required UserModel newUser}) async {
    try {
      final userData = newUser.toEntity();
      await driftDb.insertUser(userData);
    } catch (e, s) {
      logE.error(e, s);
      throw DriftException(message: e.toString());
    }
  }

  Future<List<UserModel>> getAllUsersWithGroup() async {
    try {
      final users = await driftDb.getAllUsersWithGroups();
      return users;
    } catch (e, s) {
      logE.error(e, s);
      throw DriftException(message: e.toString());
    }
  }

  Future<List<UserModel>> getAllUsersInGroup(
    String groupUid,
  ) async {
    try {
      final users = await driftDb.getAllUsersInGroup(groupUid);
      return users;
    } catch (e, s) {
      logE.error(e, s);
      throw DriftException(message: e.toString());
    }
  }

  Future<void> deleteUser({required String userId}) async {
    try {
      await driftDb.deleteUser(userId);
    } catch (e, s) {
      logE.error(e, s);
      throw DriftException(message: e.toString());
    }
  }

  Future<void> editUser({required UserModel editedUser}) async {
    try {
      final userData = editedUser.toEntity();
      await driftDb.updateUser(userData);
    } catch (e, s) {
      logE.error(e, s);
      throw DriftException(message: e.toString());
    }
  }

  Future<List<UserModel>> getAllUsersOutsideGroup(String groupUid) async {
    try {
      final users = await driftDb.getAllUsersOutsideGroup(groupUid);
      return users;
    } catch (e, s) {
      logE.error(e, s);
      throw DriftException(message: e.toString());
    }
  }
}
