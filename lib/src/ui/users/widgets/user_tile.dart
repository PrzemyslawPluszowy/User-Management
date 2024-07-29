import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/ui/users/add_or_update_user_dialog/add_or_update_user_dialog.dart';
import 'package:user_management/src/ui/users/add_or_update_user_dialog/cubit/postal_code_cubit.dart';
import 'package:user_management/src/ui/users/cubit/users_cubit.dart';
import 'package:user_management/src/ui/users/widgets/delete_user_dialog.dart';
import 'package:user_management/src/ui/users/widgets/tile_text_span.dart';

class UserTile extends StatelessWidget {
  UserTile({
    required this.user,
    required this.index,
    required this.isChecked,
    required this.selectedUserToRemove,
    super.key,
  });

  final UserModel user;
  final int index;
  final bool isChecked;

  final ValueNotifier<bool> _isTileExpanded = ValueNotifier(false);
  final ValueNotifier<List<UserModel>> selectedUserToRemove;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedBackgroundColor: index.isEven
          ? context.colorScheme.surface.withOpacity(0.3)
          : context.colorScheme.surface,
      backgroundColor: index.isEven
          ? context.colorScheme.surface
          : context.colorScheme.surface.withOpacity(0.3),
      onExpansionChanged: (isExpanded) {
        _isTileExpanded.value = isExpanded;
      },
      leading: Text('${index + 1}.'),
      title: Row(
        children: [
          const Icon(Icons.person),
          gapW12,
          Text(
            '${user.name} ${user.surName}',
          ),
        ],
      ),
      trailing: ValueListenableBuilder(
        valueListenable: _isTileExpanded,
        builder: (_, isExpanded, child) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox.adaptive(
              value: isChecked,
              onChanged: (_) {
                if (isChecked) {
                  selectedUserToRemove.value.remove(user);
                  final updatedList =
                      List<UserModel>.from(selectedUserToRemove.value);
                  selectedUserToRemove.value = updatedList;
                } else {
                  selectedUserToRemove.value.add(user);
                  final updatedList =
                      List<UserModel>.from(selectedUserToRemove.value);
                  selectedUserToRemove.value = updatedList;
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                showDialog<BuildContext>(
                  context: context,
                  builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: context.read<UsersCubit>(),
                      ),
                      BlocProvider(
                        create: (context) =>
                            PostalCodeCubit(postalCodeRepository: getIt.call()),
                      ),
                    ],
                    child: AddOrUpdateUserDialog(
                      editedUser: user,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: context.colorScheme.error,
              ),
              onPressed: () {
                showDialog<BuildContext>(
                  context: context,
                  builder: (_) => BlocProvider.value(
                    value: context.read<UsersCubit>(),
                    child: DeleteUserDialog(user: user),
                  ),
                );
              },
            ),
            if (isExpanded)
              const Icon(Icons.arrow_drop_up)
            else
              const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
      children: expandedTile(context),
    );
  }

  List<Widget> expandedTile(BuildContext context) {
    return <Widget>[
      ListTile(
        title: Text(
          context.l10n.address,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TileTextSpan(
              firstField: context.l10n.city,
              secondField: user.city,
            ),
            TileTextSpan(
              firstField: context.l10n.postCode,
              secondField: user.postalCode,
            ),
            if (user.street != null)
              TileTextSpan(
                firstField: context.l10n.street,
                secondField: user.street!,
              ),
            TileTextSpan(
              firstField: context.l10n.hauseNumber,
              secondField: user.houseNumber,
            ),
            if (user.flatNumber != null)
              TileTextSpan(
                firstField: context.l10n.flatNumber,
                secondField: user.flatNumber!,
              ),
            gapH12,
            if (user.groups.isNotEmpty)
              Text(
                '${context.l10n.groups}:',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (user.groups.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: Sizes.p8),
                child: Wrap(
                  spacing: Sizes.p8,
                  children: [
                    for (final group in user.groups)
                      Chip(
                        padding: EdgeInsets.zero,
                        backgroundColor:
                            context.colorScheme.secondary.withOpacity(0.5),
                        label: Text(group.name),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    ];
  }
}
