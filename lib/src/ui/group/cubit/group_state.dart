part of 'group_cubit.dart';

@freezed
class GroupState with _$GroupState {
  const factory GroupState.initial() = _Initial;
  const factory GroupState.loading() = _Loading;
  const factory GroupState.success(List<GroupModel> groups) = _Success;
  const factory GroupState.error(GroupL10nExceptions err) = _Error;
}
