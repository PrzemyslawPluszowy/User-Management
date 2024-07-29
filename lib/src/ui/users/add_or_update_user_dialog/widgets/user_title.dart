import 'package:user_management/main_export.dart';

class UserTitle extends StatelessWidget {
  const UserTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: Ui.boxDecoration(context).copyWith(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: context.colorScheme.primary.withOpacity(0.5),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.close,
              color: context.colorScheme.onPrimary,
              size: Sizes.p32,
            ),
          ),
          Text(
            context.l10n.addUser,
            style: context.textTheme.headlineSmall?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
