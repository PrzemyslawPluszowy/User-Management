import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_management/main.dart';
import 'package:user_management/main_export.dart';
import 'package:user_management/src/exceptions/custom_exceptions.dart';
import 'package:user_management/src/models/group_model.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/services/group_service.dart';

part 'group_state.dart';
part 'group_cubit.freezed.dart';

enum GroupL10nExceptions {
  writeDb,
  unknown;

  String l10n(BuildContext context) {
    switch (this) {
      case GroupL10nExceptions.writeDb:
        return context.l10n.driftError;
      case GroupL10nExceptions.unknown:
        return context.l10n.unknownError;
    }
  }
}

class GroupCubit extends Cubit<GroupState> {
  GroupCubit({
    required this.groupService,
  }) : super(const GroupState.initial()) {
    fetchGroups();
  }

  final GroupService groupService;
  List<GroupModel> tmpList = [];

  Future<void> fetchGroups() async {
    emit(const GroupState.loading());
    try {
      final groups = await groupService.getGroups();
      tmpList = List<GroupModel>.from(groups);
      emit(GroupState.success(groups));
    } on DriftException catch (e, s) {
      logE.error(e, s);
      emit(const GroupState.error(GroupL10nExceptions.writeDb));
    } catch (e, s) {
      logE.error(e, s);
      emit(const GroupState.error(GroupL10nExceptions.unknown));
    }
  }

  void searchGroup(String query) {
    if (query.isEmpty) {
      emit(GroupState.success(tmpList));
      return;
    }
    final actualListState = state.whenOrNull(
      success: (groups) => groups,
    );
    if (actualListState != null) {
      final filteredList = actualListState.where((element) {
        return element.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      emit(GroupState.success(filteredList));
    }
  }

  Future<void> selectGroup(GroupModel group) async {
    unawaited(groupService.selectGroup(group));
  }

  Future<void> addUsersToGroup({
    required GroupModel group,
    required List<UserModel> users,
  }) async {
    emit(
      const GroupState.loading(),
    );
    await groupService.addUsersToGroup(group, users);
    await fetchGroups();
    await selectGroup(group);
  }

  Future<void> removeUsersFromGroup({
    required GroupModel group,
    required List<UserModel> users,
  }) async {
    emit(
      const GroupState.loading(),
    );
    for (final item in users) {
      await groupService.removeUserFromGroup(item.uid, group.uid);
    }
    await fetchGroups();
    await selectGroup(group);
  }

  Future<void> deleteGroup(GroupModel group) async {
    emit(const GroupState.loading());

    await groupService.deleteGroup(group);
    await fetchGroups();
    unawaited(groupService.selectGroup(null));
  }
}
