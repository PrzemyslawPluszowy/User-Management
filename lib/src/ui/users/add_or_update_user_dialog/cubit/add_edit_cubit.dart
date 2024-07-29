import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_management/main.dart';
import 'package:user_management/src/exceptions/custom_exceptions.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/services/users_service.dart';
import 'package:user_management/utils/extension/l10n.dart';

part 'add_edit_state.dart';
part 'add_edit_cubit.freezed.dart';

enum CreateUserExceptions {
  writeDb,
  unknown;

  String l10n(BuildContext context) {
    switch (this) {
      case CreateUserExceptions.writeDb:
        return context.l10n.driftError;
      case CreateUserExceptions.unknown:
        return context.l10n.unknownError;
    }
  }
}

class AddEditCubit extends Cubit<AddEditState> {
  AddEditCubit({
    required this.userService,
  }) : super(const AddEditState.initial());

  final UserService userService;

  Future<void> addUser({required UserModel newUser}) async {
    emit(const AddEditState.loading());

    try {
      await userService.createUser(newUser: newUser);
      emit(const AddEditState.success());
    } on DriftException catch (e, s) {
      logE.error(e, s);
      emit(const AddEditState.error(CreateUserExceptions.writeDb));
    } catch (e, s) {
      logE.error(e, s);
      emit(const AddEditState.error(CreateUserExceptions.unknown));
    }
  }

  Future<void> editUser({required UserModel editedUser}) async {
    emit(const AddEditState.loading());

    try {
      await userService.editUser(editedUser: editedUser);
      emit(const AddEditState.success());
    } on DriftException catch (e, s) {
      logE.error(e, s);
      emit(const AddEditState.error(CreateUserExceptions.writeDb));
    } catch (e, s) {
      logE.error(e, s);
      emit(const AddEditState.error(CreateUserExceptions.unknown));
    }
  }
}
