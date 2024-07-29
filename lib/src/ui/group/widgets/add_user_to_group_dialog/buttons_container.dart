import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/group_model.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/ui/group/cubit/group_cubit.dart';

class ButtonsContainer extends StatelessWidget {
  const ButtonsContainer({
    required this.group,
    required this.selectedUser,
    super.key,
  });

  final GroupModel group;
  final ValueNotifier<List<UserModel>> selectedUser;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Ui.borderRadiusLarge.bottomLeft,
        bottomRight: Ui.borderRadiusLarge.bottomRight,
      ),
      child: ColoredBox(
        color: context.colorScheme.primary.withOpacity(0.5),
        child: BlocConsumer<GroupCubit, GroupState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      context.l10n.usersAddedToGroup,
                    ),
                  ),
                );
                context.pop();
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message.l10n(context)),
                  ),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: Ui.paddingMedium,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        context.colorScheme.errorContainer,
                      ),
                    ),
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('Cancel'),
                  ),
                ),
                Padding(
                  padding: Ui.paddingMedium,
                  child: state.maybeWhen(
                    loading: () => const CircularProgressIndicator(),
                    orElse: () => ElevatedButton(
                      style: const ButtonStyle(),
                      onPressed: () async {
                        if (selectedUser.value.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                context.l10n.pleaseSelectAtLeastOneUser,
                              ),
                            ),
                          );
                          return;
                        }
                        await context.read<GroupCubit>().addUsersToGroup(
                              group: group,
                              users: selectedUser.value,
                            );
                      },
                      child: Text(
                        context.l10n.addUsersToGroup,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
