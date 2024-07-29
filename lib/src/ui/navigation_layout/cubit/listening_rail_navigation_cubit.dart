import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_management/src/ui/navigation_layout/navigation_layout.dart';

part 'listening_rail_navigation_state.dart';
part 'listening_rail_navigation_cubit.freezed.dart';

///this cubit listning change rail navigation
///use for refresh data when user switching

class ListeningRailNavigationCubit extends Cubit<ListeningRailNavigationState> {
  ListeningRailNavigationCubit()
      : super(const ListeningRailNavigationState.users());

  void changeToUsers(BottomRouting railRouting) {
    switch (railRouting) {
      case BottomRouting.users:
        emit(const ListeningRailNavigationState.users());
      case BottomRouting.group:
        emit(const ListeningRailNavigationState.groups());
      case BottomRouting.settings:
        emit(const ListeningRailNavigationState.users());
    }
  }
}
