import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/group_model.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/ui/group/cubit/group_cubit.dart';

class RemoveUserFromGroupDialog extends StatelessWidget {
  const RemoveUserFromGroupDialog({
    required this.selectedTilesToRemove,
    required this.group,
    super.key,
  });

  final List<UserModel> selectedTilesToRemove;
  final GroupModel group;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        context.l10n.removeUsers,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.l10n.confirmRemoveSelectedUsers,
            style: context.textTheme.bodyLarge,
          ),
          gapH8,
          Wrap(
            runSpacing: Sizes.p4,
            spacing: Sizes.p8,
            children: selectedTilesToRemove
                .map(
                  (user) => Chip(
                    elevation: 5,
                    padding: EdgeInsets.zero,
                    color: WidgetStatePropertyAll(
                      context.colorScheme.secondaryContainer,
                    ),
                    label: Text('${user.name} ${user.surName}'),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(context.l10n.cancel),
        ),
        TextButton(
          onPressed: () {
            context.read<GroupCubit>().removeUsersFromGroup(
                  group: group,
                  users: selectedTilesToRemove,
                );

            context.pop();
          },
          child: Text(
            context.l10n.remove,
            style: TextStyle(
              color: context.colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }
}
