import 'package:user_management/common/widgets/background_container.dart';
import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/ui/navigation_layout/cubit/listening_rail_navigation_cubit.dart';
import 'package:user_management/src/ui/users/cubit/users_cubit.dart';
import 'package:user_management/src/ui/users/widgets/horizontal_search_bar.dart';
import 'package:user_management/src/ui/users/widgets/user_tile.dart';
import 'package:user_management/src/ui/users/widgets/users_app_bar.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UsersCubit(userService: getIt.call())..fetchUsers(),
        ),
      ],
      child: BackGroundContainer(
        child: BlocListener<ListeningRailNavigationCubit,
            ListeningRailNavigationState>(
          listenWhen: (previous, current) {
            return previous != current;
          },
          listener: (context, state) {
            state.whenOrNull(
              users: () => context.read<UsersCubit>().fetchUsers(),
            );
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: UsersAppBar(),
            ),
            body: BlocBuilder<UsersCubit, UsersState>(
              builder: (context, state) {
                return state.when(
                  initial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err) => _errorLoadingUserListWidget(context, err),
                  success: (users) {
                    final selectedUserToRemove =
                        ValueNotifier<List<UserModel>>([]);

                    return Column(
                      children: [
                        HorizontalSearchBar(
                          sleetedUserToRemove: selectedUserToRemove,
                        ),
                        Expanded(
                          child: users.isNotEmpty
                              ? ListView.separated(
                                  itemCount: users.length,
                                  separatorBuilder: (context, index) => gapH4,
                                  itemBuilder: (_, index) {
                                    final user = users[index];
                                    return ValueListenableBuilder(
                                      valueListenable: selectedUserToRemove,
                                      builder: (context, selectedList, child) =>
                                          UserTile(
                                        selectedUserToRemove:
                                            selectedUserToRemove,
                                        isChecked: selectedList.contains(user),
                                        user: user,
                                        index: index,
                                      ),
                                    );
                                  },
                                )
                              : _emptyList(context),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Center _emptyList(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.people,
            size: Sizes.p48,
          ),
          Text(context.l10n.noUsers),
        ],
      ),
    );
  }

  Center _errorLoadingUserListWidget(
    BuildContext context,
    UserL10nExceptions err,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: context.colorScheme.error),
          Text(
            err.l10n(context),
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.error,
            ),
          ),
          gapH24,
          FilledButton.icon(
            onPressed: () {
              context.read<UsersCubit>().fetchUsers();
            },
            label: Text(
              context.l10n.tryAgain,
            ),
          ),
        ],
      ),
    );
  }
}
