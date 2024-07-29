import 'package:user_management/main_export.dart';

class AddUserToGroupAppBar extends StatelessWidget {
  const AddUserToGroupAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Ui.borderRadiusLarge.topLeft,
        topRight: Ui.borderRadiusLarge.topRight,
      ),
      child: Container(
        color: context.colorScheme.primary.withOpacity(0.5),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.close,
                color: context.colorScheme.primary,
                size: Sizes.p32,
              ),
            ),
            Text(
              context.l10n.addUser,
              style: context.textTheme.headlineSmall?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
