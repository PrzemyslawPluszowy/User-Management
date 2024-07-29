part of 'preview_users_cubit_cubit.dart';

@freezed
class PreviewUsersCubitState with _$PreviewUsersCubitState {
  const factory PreviewUsersCubitState.initial() = _Initial;
  const factory PreviewUsersCubitState.loading() = _Loading;
  const factory PreviewUsersCubitState.success({
    required List<UserModel> users,
    required GroupModel group,
  }) = _Success;
  const factory PreviewUsersCubitState.error() = _Error;
}
