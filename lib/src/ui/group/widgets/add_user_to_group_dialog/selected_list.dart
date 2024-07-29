import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/user_model.dart';

class SelectedList extends StatelessWidget {
  const SelectedList({
    required this.selectedUser,
    required this.usersOutsideGroup,
    super.key,
  });

  final ValueNotifier<List<UserModel>> selectedUser;
  final ValueNotifier<List<UserModel>> usersOutsideGroup;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<UserModel>>(
      valueListenable: selectedUser,
      builder: (_, selectedUsers, child) {
        if (selectedUsers.isEmpty) {
          return Center(
            child: Text(
              context.l10n.noUsersSelected,
            ),
          );
        }
        return Column(
          children: [
            gapH8,
            Padding(
              padding: Ui.paddingMedium,
              child: Text(
                context.l10n.usersSelectedToAssignGroup,
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.separated(
                itemCount: selectedUsers.length,
                separatorBuilder: (context, index) => gapH4,
                itemBuilder: (_, index) {
                  final user = selectedUsers[index];
                  return _tile(index, user, selectedUsers);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  ListTile _tile(int index, UserModel user, List<UserModel> selectedUsers) {
    return ListTile(
      title: Row(
        children: [
          Text('${index + 1}.'),
          Text(
            ' ${user.name} ${user.surName}',
          ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.remove),
        onPressed: () {
          usersOutsideGroup.value = [
            ...usersOutsideGroup.value,
            user,
          ];
          selectedUsers.removeWhere(
            (element) => element.uid == user.uid,
          );

          ///create defensive copy to refresh state
          final newSelectedList = List<UserModel>.from(selectedUsers);
          selectedUser.value = newSelectedList;
        },
      ),
    );
  }
}
