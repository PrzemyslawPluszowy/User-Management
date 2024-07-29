part of 'users_cubit.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.initial() = _Initial;
  const factory UsersState.loading() = _Loading;
  const factory UsersState.success({
    required List<UserModel> users,
  }) = _Success;
  const factory UsersState.error(
    UserL10nExceptions exception,
  ) = _Error;
}
