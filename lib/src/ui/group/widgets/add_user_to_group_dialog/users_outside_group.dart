import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/user_model.dart';

class UserOutsideGroup extends StatelessWidget {
  const UserOutsideGroup({
    required this.selectedUser,
    required this.usersOutsideGroup,
    super.key,
  });

  final ValueNotifier<List<UserModel>> selectedUser;
  final ValueNotifier<List<UserModel>> usersOutsideGroup;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          gapH8,
          Padding(
            padding: Ui.paddingMedium,
            child: Text(context.l10n.usersDoAssignGroup),
          ),
          const Divider(),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: usersOutsideGroup,
              builder: (context, users, child) {
                if (users.isEmpty) {
                  return Center(
                    child: Text(
                      context.l10n.noUsersSelected,
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: users.length,
                  separatorBuilder: (context, index) => gapH4,
                  itemBuilder: (_, index) {
                    final user = users[index];
                    return _tile(user, index, users);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile _tile(UserModel user, int index, List<UserModel> users) {
    return ListTile(
      selected: selectedUser.value.contains(user),
      title: Row(
        children: [
          Text('${index + 1}.'),
          Text(
            ' ${user.name} ${user.surName}',
          ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          selectedUser.value = [
            ...selectedUser.value,
            user,
          ];
          users.removeWhere(
            (element) => element.uid == user.uid,
          );

          ///create defensive copy to refresh state
          final updatedList = List<UserModel>.from(users);
          usersOutsideGroup.value = updatedList;
        },
      ),
    );
  }
}
