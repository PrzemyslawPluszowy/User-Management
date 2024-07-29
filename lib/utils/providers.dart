import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_management/core/di.dart';
import 'package:user_management/src/ui/group/add_or_edit_group/cubit/add_or_edit_group_cubit.dart';
import 'package:user_management/src/ui/group/cubit/preview_users_cubit_cubit.dart';
import 'package:user_management/src/ui/navigation_layout/cubit/listening_rail_navigation_cubit.dart';
import 'package:user_management/src/ui/setting/cubit/theme_logic_cubit.dart';
import 'package:user_management/src/ui/users/add_or_update_user_dialog/cubit/add_edit_cubit.dart';

class Providers {
  static List<BlocProvider<dynamic>> getBlocProviders() {
    return [
      BlocProvider<AddEditCubit>(
        create: (_) => AddEditCubit(
          userService: getIt.call(),
        ),
      ),
      BlocProvider<AddOrEditGroupCubit>(
        create: (_) => AddOrEditGroupCubit(
          groupService: getIt.call(),
        ),
      ),
      BlocProvider<PreviewUsersCubitCubit>(
        create: (_) => PreviewUsersCubitCubit(
          groupService: getIt.call(),
        ),
      ),
      BlocProvider<ListeningRailNavigationCubit>(
        lazy: false,
        create: (_) => ListeningRailNavigationCubit(),
      ),
      BlocProvider<ThemeLogicCubit>(
        lazy: false,
        create: (_) => ThemeLogicCubit(),
      ),
    ];
  }
}
