import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/group_model.dart';
import 'package:user_management/src/ui/group/cubit/group_cubit.dart';

class RemoveGroupDialog extends StatelessWidget {
  const RemoveGroupDialog({
    required this.group,
    super.key,
  });

  final GroupModel group;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Icon(
          Icons.warning,
          color: context.colorScheme.error,
          size: Sizes.p32,
        ),
      ),
      content: Text(
        context.l10n.removeGroups,
        style: context.textTheme.bodyLarge?.copyWith(
          color: context.colorScheme.error,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            context.l10n.cancel,
          ),
        ),
        TextButton(
          onPressed: () {
            context.read<GroupCubit>().deleteGroup(group);
            context.pop();
          },
          child: Text(
            context.l10n.delete,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }
}
