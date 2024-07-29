import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_management/main.dart';
import 'package:user_management/main_export.dart';
import 'package:user_management/src/exceptions/custom_exceptions.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/services/users_service.dart';

part 'users_state.dart';
part 'users_cubit.freezed.dart';

enum UserL10nExceptions {
  writeDb,
  unknown;

  String l10n(BuildContext context) {
    switch (this) {
      case UserL10nExceptions.writeDb:
        return context.l10n.driftError;
      case UserL10nExceptions.unknown:
        return context.l10n.unknownError;
    }
  }
}

class UsersCubit extends Cubit<UsersState> {
  UsersCubit({
    required this.userService,
  }) : super(const UsersState.initial());

  final UserService userService;
  List<UserModel> tmp = [];

  Future<void> fetchUsers() async {
    emit(const UsersState.loading());
    try {
      final users = await userService.getAllUsersWithGroup();
      tmp = List<UserModel>.from(users);

      emit(UsersState.success(users: users));
    } on DriftException catch (e, s) {
      logE.error(e, s);
      emit(
        const UsersState.error(
          UserL10nExceptions.writeDb,
        ),
      );
    } catch (e, s) {
      logE.error(e, s);
      emit(
        const UsersState.error(
          UserL10nExceptions.unknown,
        ),
      );
    }
  }

//use for list inside group
  Future<void> fetchUsersNotInGroup(String groupUid) async {
    emit(const UsersState.loading());
    try {
      final users = await userService.getAllUsersOutsideGroup(groupUid);

      emit(UsersState.success(users: users));
    } on DriftException catch (e, s) {
      logE.error(e, s);
      emit(
        const UsersState.error(
          UserL10nExceptions.writeDb,
        ),
      );
    } catch (e, s) {
      logE.error(e, s);
      emit(
        const UsersState.error(
          UserL10nExceptions.unknown,
        ),
      );
    }
  }

  Future<void> deleteUser(String userUid) async {
    try {
      await userService.deleteUser(userId: userUid);
      //refreshing list after deleting user
      await fetchUsers();
    } on DriftException catch (e, s) {
      logE.error(e, s);
      emit(
        const UsersState.error(
          UserL10nExceptions.writeDb,
        ),
      );
    } catch (e, s) {
      logE.error(e, s);
      emit(
        const UsersState.error(
          UserL10nExceptions.unknown,
        ),
      );
    }
  }

  void searchUsers(String query) {
    if (query.isEmpty) {
      emit(UsersState.success(users: tmp));
    } else {
      final searchedUsers = tmp.where((user) {
        final name = user.name.toLowerCase();
        final surname = user.surName.toLowerCase();
        final queryLower = query.toLowerCase();
        return name.contains(queryLower) || surname.contains(queryLower);
      }).toList();
      emit(UsersState.success(users: searchedUsers));
    }
  }

  Future<void> removeUsers(List<UserModel> selectedTilesToRemove) async {
    emit(const UsersState.loading());
    try {
      for (final user in selectedTilesToRemove) {
        await userService.deleteUser(userId: user.uid);
      }
      await fetchUsers();
    } on DriftException catch (e, s) {
      logE.error(e, s);
      emit(
        const UsersState.error(
          UserL10nExceptions.writeDb,
        ),
      );
    } catch (e, s) {
      logE.error(e, s);
      emit(
        const UsersState.error(
          UserL10nExceptions.unknown,
        ),
      );
    }
  }
}
