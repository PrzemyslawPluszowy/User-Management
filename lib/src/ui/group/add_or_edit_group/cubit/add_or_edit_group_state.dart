part of 'add_or_edit_group_cubit.dart';

@freezed
class AddOrEditGroupState with _$AddOrEditGroupState {
  const factory AddOrEditGroupState.initial() = _Initial;
  const factory AddOrEditGroupState.loading() = _Loading;
  const factory AddOrEditGroupState.success() = _Success;
  const factory AddOrEditGroupState.error(
    GroupL10nExceptions exception,
  ) = _Error;
}
