import 'package:user_management/main_export.dart';
import 'package:user_management/src/ui/group/add_or_edit_group/add_or_edit_group_dialog.dart';
import 'package:user_management/src/ui/group/cubit/group_cubit.dart';
import 'package:user_management/src/ui/group/widgets/remove_group_dialog.dart';

class ListGroupUsers extends StatelessWidget {
  const ListGroupUsers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupCubit, GroupState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: Ui.paddingSmall,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: context.l10n.search,
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (value) {
                  context.read<GroupCubit>().searchGroup(value);
                },
              ),
            ),
            Expanded(
              child: state.when(
                initial: SizedBox.new,
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (err) => Text(err.l10n(context)),
                success: (groups) {
                  if (groups.isEmpty) {
                    return Center(
                      child: Text(context.l10n.noGroups),
                    );
                  }
                  return ListView.builder(
                    itemCount: groups.length,
                    itemBuilder: (context, index) {
                      final group = groups[index];
                      return ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: Sizes.p8),
                        dense: true,
                        tileColor: index.isEven
                            ? context.colorScheme.surface.withOpacity(0.3)
                            : context.colorScheme.surface,
                        title: Text(
                          group.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.edit_note_outlined,
                                color: context.colorScheme.primary,
                              ),
                              onPressed: () {
                                showAdaptiveDialog<BuildContext>(
                                  context: context,
                                  builder: (_) => BlocProvider.value(
                                    value: context.read<GroupCubit>(),
                                    child: AddOrEditGroupDialog(
                                      editedGroup: group,
                                    ),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.delete_outline,
                                color: context.colorScheme.error,
                              ),
                              onPressed: () {
                                showAdaptiveDialog<BuildContext>(
                                  context: context,
                                  builder: (_) => BlocProvider.value(
                                    value: context.read<GroupCubit>(),
                                    child: RemoveGroupDialog(group: group),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          context.read<GroupCubit>().selectGroup(group);
                        },
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
  }
}
