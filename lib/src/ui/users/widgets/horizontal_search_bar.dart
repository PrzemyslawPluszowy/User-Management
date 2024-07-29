import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/ui/users/cubit/users_cubit.dart';
import 'package:user_management/src/ui/users/widgets/remove_dialog.dart';

class HorizontalSearchBar extends StatelessWidget {
  const HorizontalSearchBar({
    required this.sleetedUserToRemove,
    super.key,
  });
  final ValueNotifier<List<UserModel>> sleetedUserToRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colorScheme.primary.withOpacity(0.5),
            Colors.transparent,
          ],
        ),
      ),
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: Ui.paddingSmall,
              child: TextFormField(
                onChanged: (value) {
                  context.read<UsersCubit>().searchUsers(value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: Ui.borderRadiusSmall,
                  ),
                  hintText: context.l10n.search,
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          ValueListenableBuilder(
            valueListenable: sleetedUserToRemove,
            builder: (context, selectedList, _) => selectedList.isEmpty
                ? const Spacer()
                : Expanded(
                    child: OutlinedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          context.colorScheme.error,
                        ),
                        padding: const WidgetStatePropertyAll(
                          EdgeInsets.all(Sizes.p8),
                        ),
                      ),
                      onPressed: () {
                        showAdaptiveDialog<BuildContext>(
                          context: context,
                          builder: (_) => BlocProvider.value(
                            value: context.read<UsersCubit>(),
                            child: RemoveUsersDialog(
                              selectedTilesToRemove: selectedList,
                            ),
                          ),
                        );
                      },
                      label: Text(
                        context.l10n.removeSelectedUsers,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colorScheme.surface,
                        ),
                      ),
                    ),
                  ),
          ),
          gapW8,
        ],
      ),
    );
  }
}
