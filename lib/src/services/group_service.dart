import 'package:rxdart/rxdart.dart';
import 'package:user_management/main.dart';
import 'package:user_management/src/data/local/drift_repository.dart';
import 'package:user_management/src/exceptions/custom_exceptions.dart';
import 'package:user_management/src/models/group_model.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/services/users_service.dart';

typedef IsLoading = bool;

class GroupService {
  GroupService({
    required this.driftDb,
    required this.userService,
  }) {
    selectedGroupPreview =
        BehaviorSubject<(GroupModel?, List<UserModel>?, IsLoading isLoading)>();
  }
  final DriftRepository driftDb;
  final UserService userService;

  late BehaviorSubject<(GroupModel?, List<UserModel>?, IsLoading isLoading)>
      selectedGroupPreview;

  Future<void> addGroup({required GroupModel newGroup}) async {
    try {
      final groupEntity = newGroup.toEntity();
      await driftDb.insertGroup(groupEntity);
    } catch (e, s) {
      logE.error(e, s);
      throw DriftException(message: e.toString());
    }
  }

  Future<List<GroupModel>> getGroups() async {
    try {
      final groups = await driftDb.getGroups();
      return groups.map(GroupModel.fromEntity).toList();
    } catch (e, s) {
      logE.error(e, s);
      throw DriftException(message: e.toString());
    }
  }

  Future<void> selectGroup(GroupModel? group) async {
    if (group == null) {
      selectedGroupPreview.sink.add((null, null, false));
      return;
    }
    try {
      selectedGroupPreview.sink.add((null, null, true));
      final users = await userService.getAllUsersInGroup(group.uid);
      selectedGroupPreview.sink.add((group, users, false));
    } catch (e) {
      selectedGroupPreview.addError(const GeneralException());
    }
  }

  Future<void> addUsersToGroup(GroupModel group, List<UserModel> users) async {
    try {
      for (final user in users) {
        await driftDb.assignUserToGroup(user.uid, group.uid);
      }
    } catch (e, s) {
      logE.error(e, s);
      throw DriftException(message: e.toString());
    }
  }

  Future<void> removeUserFromGroup(String userId, String groupId) async {
    try {
      await driftDb.removeUserFromGroup(userId, groupId);
    } catch (e, s) {
      logE.error(e, s);
      throw DriftException(message: e.toString());
    }
  }

  Future<void> deleteGroup(GroupModel group) async {
    try {
      await driftDb.deleteGroup(group.uid);
    } catch (e, s) {
      logE.error(e, s);
      throw DriftException(message: e.toString());
    }
  }

  Future<void> editGroup({required GroupModel editedGroup}) async {
    try {
      final groupEntity = editedGroup.toEntity();
      await driftDb.updateGroup(groupEntity);
    } catch (e, s) {
      logE.error(e, s);
      throw DriftException(message: e.toString());
    }
  }
}
