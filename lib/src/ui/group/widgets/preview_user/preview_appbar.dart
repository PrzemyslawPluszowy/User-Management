import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/group_model.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/ui/group/cubit/group_cubit.dart';
import 'package:user_management/src/ui/group/cubit/preview_users_cubit_cubit.dart';
import 'package:user_management/src/ui/group/widgets/add_user_to_group_dialog/add_user_dialog.dart';
import 'package:user_management/src/ui/group/widgets/remove_users_dialog/remove_users_dialog.dart';

class PreviewAppBar extends StatelessWidget {
  const PreviewAppBar({
    required this.group,
    required this.userCount,
    required this.selectedTilesListToRemove,
    super.key,
  });

  final GroupModel group;
  final int userCount;
  final ValueNotifier<List<UserModel>> selectedTilesListToRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colorScheme.surface.withOpacity(1),
            context.colorScheme.primary.withOpacity(0.5),
          ],
        ),
      ),
      padding: Ui.paddingSmall,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  group.name,
                  style: context.textTheme.bodyLarge,
                ),
                if (group.description != null)
                  Text(
                    maxLines: 2,
                    group.description!,
                    style: context.textTheme.bodySmall,
                  ),
                Text(
                  maxLines: 1,
                  '${context.l10n.numberOfUsers} $userCount',
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const Spacer(),
          ValueListenableBuilder(
            valueListenable: selectedTilesListToRemove,
            builder: (_, selectedTiles, __) {
              return selectedTiles.isNotEmpty
                  ? _removeUsersFromGroupBtn(context)
                  : const SizedBox();
            },
          ),
          _addUsersBtn(context),
        ],
      ),
    );
  }

  Padding _addUsersBtn(BuildContext context) {
    return Padding(
      padding: Ui.paddingSmall,
      child: OutlinedButton.icon(
        icon: const Icon(Icons.person_add),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            context.colorScheme.tertiaryContainer,
          ),
        ),
        onPressed: () {
          showDialog<BuildContext>(
            context: context,
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: context.read<PreviewUsersCubitCubit>(),
                ),
                BlocProvider.value(
                  value: context.read<GroupCubit>(),
                ),
              ],
              child: AddUserToGroupDialog(group: group),
            ),
          ).whenComplete(() {
            selectedTilesListToRemove.value = [];
          });
        },
        label: Text(context.l10n.addUser),
      ),
    );
  }

  Padding _removeUsersFromGroupBtn(BuildContext context) {
    return Padding(
      padding: Ui.paddingSmall,
      child: OutlinedButton.icon(
        icon: const Icon(Icons.remove_circle),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            context.colorScheme.errorContainer,
          ),
        ),
        onPressed: () {
          showDialog<BuildContext>(
            context: context,
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: context.read<PreviewUsersCubitCubit>(),
                ),
                BlocProvider.value(
                  value: context.read<GroupCubit>(),
                ),
              ],
              child: RemoveUserFromGroupDialog(
                group: group,
                selectedTilesToRemove: selectedTilesListToRemove.value,
              ),
            ),
          );
        },
        label: Text(context.l10n.removeUsers),
      ),
    );
  }
}
