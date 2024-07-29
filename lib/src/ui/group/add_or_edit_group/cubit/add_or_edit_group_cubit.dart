import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_management/main.dart';
import 'package:user_management/main_export.dart';
import 'package:user_management/src/exceptions/custom_exceptions.dart';
import 'package:user_management/src/models/group_model.dart';
import 'package:user_management/src/services/group_service.dart';

part 'add_or_edit_group_state.dart';
part 'add_or_edit_group_cubit.freezed.dart';

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

class AddOrEditGroupCubit extends Cubit<AddOrEditGroupState> {
  AddOrEditGroupCubit({
    required this.groupService,
  }) : super(const AddOrEditGroupState.initial());

  final GroupService groupService;

  Future<void> addGroup({required GroupModel groupUsers}) async {
    emit(const AddOrEditGroupState.loading());

    try {
      await groupService.addGroup(newGroup: groupUsers);
      emit(const AddOrEditGroupState.success());
    } on DriftException catch (e, s) {
      logE.error(e, s);
      emit(const AddOrEditGroupState.error(GroupL10nExceptions.writeDb));
    } catch (e, s) {
      logE.error(e, s);
      emit(const AddOrEditGroupState.error(GroupL10nExceptions.unknown));
    }
  }

  Future<void> editGroup({required GroupModel groupUsers}) async {
    emit(const AddOrEditGroupState.loading());

    try {
      await groupService.editGroup(editedGroup: groupUsers);
      unawaited(
        groupService.selectGroup(groupUsers),
      );

      emit(const AddOrEditGroupState.success());
    } on DriftException catch (e, s) {
      logE.error(e, s);
      emit(const AddOrEditGroupState.error(GroupL10nExceptions.writeDb));
    } catch (e, s) {
      logE.error(e, s);
      emit(const AddOrEditGroupState.error(GroupL10nExceptions.unknown));
    }
  }
}
