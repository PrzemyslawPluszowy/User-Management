import 'package:user_management/main_export.dart';
import 'package:user_management/src/ui/users/add_or_update_user_dialog/add_or_update_user_dialog.dart';
import 'package:user_management/src/ui/users/add_or_update_user_dialog/cubit/postal_code_cubit.dart';
import 'package:user_management/src/ui/users/cubit/users_cubit.dart';

class UsersAppBar extends StatelessWidget {
  const UsersAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(context.l10n.users),
      actions: [
        //refresh list
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            context.read<UsersCubit>().fetchUsers();
          },
        ),
        gapW12,
        FilledButton.icon(
          style: const ButtonStyle(
            visualDensity: VisualDensity.compact,
          ),
          onPressed: () {
            showAdaptiveDialog<AddOrUpdateUserDialog>(
              context: context,
              builder: (_) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: context.read<UsersCubit>(),
                  ),
                  BlocProvider(
                    create: (_) =>
                        PostalCodeCubit(postalCodeRepository: getIt.call()),
                  ),
                ],
                child: const AddOrUpdateUserDialog(),
              ),
            );
          },
          label: Text(
            context.l10n.addUser,
          ),
        ),
        gapW12,
      ],
    );
  }
}
