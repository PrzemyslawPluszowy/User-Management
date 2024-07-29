import 'package:user_management/common/widgets/background_container.dart';
import 'package:user_management/main_export.dart';
import 'package:user_management/src/ui/group/add_or_edit_group/add_or_edit_group_dialog.dart';
import 'package:user_management/src/ui/group/add_or_edit_group/cubit/add_or_edit_group_cubit.dart';
import 'package:user_management/src/ui/group/cubit/group_cubit.dart';
import 'package:user_management/src/ui/group/widgets/list_groups.dart';
import 'package:user_management/src/ui/group/widgets/preview_user/preview_users_in_group.dart';
import 'package:user_management/src/ui/navigation_layout/cubit/listening_rail_navigation_cubit.dart';

class GroupScreens extends StatelessWidget {
  const GroupScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGroundContainer(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => GroupCubit(groupService: getIt.call()),
          ),
          BlocProvider(
            create: (_) => AddOrEditGroupCubit(groupService: getIt.call()),
          ),
        ],
        child: const Group(),
      ),
    );
  }
}

class Group extends StatelessWidget {
  const Group({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ListeningRailNavigationCubit,
        ListeningRailNavigationState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        state.whenOrNull(
          groups: () => context.read<GroupCubit>().fetchGroups(),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            title: Text(context.l10n.groups),
            actions: [
              Padding(
                padding: Ui.paddingSmall,
                child: FilledButton.icon(
                  onPressed: () {
                    showAdaptiveDialog<AddOrEditGroupDialog>(
                      context: context,
                      builder: (_) => BlocProvider.value(
                        value: context.read<GroupCubit>(),
                        child: const AddOrEditGroupDialog(),
                      ),
                    );
                  },
                  label: Text(context.l10n.addGroup),
                ),
              ),
            ],
          ),
        ),
        body: const Row(
          children: [
            Expanded(
              child: ListGroupUsers(),
            ),
            VerticalDivider(),
            Expanded(
              flex: 3,
              child: PreviewUsersInGroup(),
            ),
          ],
        ),
      ),
    );
  }
}
