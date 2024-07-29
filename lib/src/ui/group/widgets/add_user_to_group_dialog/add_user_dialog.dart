import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/group_model.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/ui/group/widgets/add_user_to_group_dialog/add_user_appbar.dart';
import 'package:user_management/src/ui/group/widgets/add_user_to_group_dialog/buttons_container.dart';
import 'package:user_management/src/ui/group/widgets/add_user_to_group_dialog/selected_list.dart';
import 'package:user_management/src/ui/group/widgets/add_user_to_group_dialog/users_outside_group.dart';
import 'package:user_management/src/ui/users/cubit/users_cubit.dart';

class AddUserToGroupDialog extends StatefulWidget {
  const AddUserToGroupDialog({
    required this.group,
    super.key,
  });

  final GroupModel group;

  @override
  State<AddUserToGroupDialog> createState() => _AddUserToGroupDialogState();
}

class _AddUserToGroupDialogState extends State<AddUserToGroupDialog> {
  late final UsersCubit userCubit;
  @override
  void initState() {
    userCubit = UsersCubit(userService: getIt.call())
      ..fetchUsersNotInGroup(widget.group.uid);
    selectedUser = ValueNotifier([]);
    usersOutsideGroup = ValueNotifier([]);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    selectedUser.dispose();
    usersOutsideGroup.dispose();
    userCubit.close();
  }

  late final ValueNotifier<List<UserModel>> selectedUser;
  late final ValueNotifier<List<UserModel>> usersOutsideGroup;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: size.width * 0.8,
          height: size.height * 0.8,
          decoration: Ui.boxDecoration(context),
          child: Column(
            children: [
              const AddUserToGroupAppBar(),
              BlocBuilder<UsersCubit, UsersState>(
                bloc: userCubit,
                builder: (context, state) {
                  return state.when(
                    initial: () =>
                        const Center(child: CircularProgressIndicator()),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (err) => Container(),
                    success: (userFromDb) {
                      usersOutsideGroup.value =
                          List<UserModel>.from(userFromDb);
                      return Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  UserOutsideGroup(
                                    selectedUser: selectedUser,
                                    usersOutsideGroup: usersOutsideGroup,
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                    child: SelectedList(
                                      usersOutsideGroup: usersOutsideGroup,
                                      selectedUser: selectedUser,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ButtonsContainer(
                              group: widget.group,
                              selectedUser: selectedUser,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
