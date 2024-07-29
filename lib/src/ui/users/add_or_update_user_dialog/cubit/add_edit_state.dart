part of 'add_edit_cubit.dart';

@freezed
class AddEditState with _$AddEditState {
  const factory AddEditState.initial() = _Initial;
  const factory AddEditState.loading() = _Loading;
  const factory AddEditState.success() = _Success;
  const factory AddEditState.error(CreateUserExceptions err) = _Error;
}
