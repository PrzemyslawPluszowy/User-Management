import 'package:user_management/main_export.dart';
import 'package:user_management/src/models/group_model.dart';
import 'package:user_management/src/models/user_model.dart';
import 'package:user_management/src/ui/group/cubit/group_cubit.dart';
import 'package:user_management/src/ui/group/widgets/remove_users_dialog/remove_users_dialog.dart';
import 'package:user_management/src/ui/users/widgets/tile_text_span.dart';

class UserTileInGroup extends StatelessWidget {
  UserTileInGroup({
    required this.user,
    required this.index,
    required this.isChecked,
    required this.selectedTiles,
    required this.group,
    super.key,
  });

  final UserModel user;
  final GroupModel group;
  final int index;
  final bool isChecked;

  final ValueNotifier<bool> _isTileExpanded = ValueNotifier(false);
  final ValueNotifier<List<UserModel>> selectedTiles;

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
                  selectedTiles.value.remove(user);
                  final newList = List<UserModel>.from(selectedTiles.value);
                  selectedTiles.value = newList;
                } else {
                  selectedTiles.value.add(user);
                  final newList = List<UserModel>.from(selectedTiles.value);
                  selectedTiles.value = newList;
                }
              },
            ),
            IconButton(
              icon: Icon(
                Icons.group_remove_outlined,
                color: context.colorScheme.error,
              ),
              onPressed: () {
                showDialog<BuildContext>(
                  context: context,
                  builder: (_) => BlocProvider.value(
                    value: context.read<GroupCubit>(),
                    child: RemoveUserFromGroupDialog(
                      selectedTilesToRemove: [user],
                      group: group,
                    ),
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
        title: Text(context.l10n.address),
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
