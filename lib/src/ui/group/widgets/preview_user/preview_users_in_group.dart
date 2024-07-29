import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/ui/group/cubit/preview_users_cubit_cubit.dart';
import 'package:user_management/src/ui/group/widgets/preview_user/preview_appbar.dart';
import 'package:user_management/src/ui/group/widgets/preview_user/user_tile_in_preciew.dart';

class PreviewUsersInGroup extends StatelessWidget {
  const PreviewUsersInGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreviewUsersCubitCubit, PreviewUsersCubitState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(
            child: Text('Select Group'),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: () => _errorPreviewUser(context),
          success: (users, group) {
            final selectedTilesListToRemove =
                ValueNotifier<List<UserModel>>([]);
            return Column(
              children: [
                PreviewAppBar(
                  selectedTilesListToRemove: selectedTilesListToRemove,
                  group: group,
                  userCount: users.length,
                ),
                if (users.isEmpty) _noUsersInList(context),
                if (users.isNotEmpty)
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: selectedTilesListToRemove,
                      builder: (_, selectedTiles, __) {
                        return ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final user = users[index];
                            return UserTileInGroup(
                              group: group,
                              selectedTiles: selectedTilesListToRemove,
                              user: user,
                              index: index,
                              isChecked: selectedTiles.contains(user),
                            );
                          },
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }

  Expanded _noUsersInList(BuildContext context) {
    return Expanded(
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

  Center _errorPreviewUser(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: Sizes.p48,
            color: context.colorScheme.error,
          ),
          Text(
            context.l10n.unknownError,
            style: context.textTheme.headlineMedium?.copyWith(
              color: context.colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}
