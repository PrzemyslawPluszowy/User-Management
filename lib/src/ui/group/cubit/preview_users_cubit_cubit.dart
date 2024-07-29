import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_management/main.dart';
import 'package:user_management/src/models/group_model.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/services/group_service.dart';

part 'preview_users_cubit_state.dart';
part 'preview_users_cubit_cubit.freezed.dart';

class PreviewUsersCubitCubit extends Cubit<PreviewUsersCubitState> {
  PreviewUsersCubitCubit({
    required this.groupService,
  }) : super(const PreviewUsersCubitState.initial()) {
    groupService.selectedGroupPreview.listen(onError: (Object e) {
      logE.error(e.toString());
      emit(const PreviewUsersCubitState.error());
    }, ((GroupModel?, List<UserModel>?, IsLoading) streamValue) {
      if (streamValue.$3) {
        emit(const PreviewUsersCubitState.loading());
      } else if (streamValue.$1 != null && streamValue.$2 != null) {
        emit(
          PreviewUsersCubitState.success(
            users: streamValue.$2!,
            group: streamValue.$1!,
          ),
        );
      } else {
        emit(const PreviewUsersCubitState.initial());
      }
    });
  }

  final GroupService groupService;
}
