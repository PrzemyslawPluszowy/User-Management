import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/ui/users/cubit/users_cubit.dart';

class RemoveUsersDialog extends StatelessWidget {
  const RemoveUsersDialog({
    required this.selectedTilesToRemove,
    super.key,
  });

  final List<UserModel> selectedTilesToRemove;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersCubit, UsersState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (err) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(err.l10n(context)),
              ),
            );
          },
          success: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  context.l10n.usersRemoved,
                ),
              ),
            );
            context.pop();
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
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
              gapH8,
              state.maybeWhen(
                orElse: SizedBox.new,
                error: (exception) => Container(
                  padding: const EdgeInsets.all(Sizes.p8),
                  decoration: BoxDecoration(
                    color: context.colorScheme.error.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(Sizes.p8),
                  ),
                  child: Text(
                    exception.l10n(context),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.error,
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(context.l10n.cancel),
            ),
            TextButton(
              onPressed: () {
                context.read<UsersCubit>().removeUsers(selectedTilesToRemove);
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
      },
    );
  }
}
