import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/ui/users/cubit/users_cubit.dart';

class DeleteUserDialog extends StatelessWidget {
  const DeleteUserDialog({
    required this.user,
    super.key,
  });

  final UserModel user;

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
        '${context.l10n.remove} ${user.name} ${user.surName}',
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
            context.read<UsersCubit>().deleteUser(user.uid);

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
