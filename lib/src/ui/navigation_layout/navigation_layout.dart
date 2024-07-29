import 'package:user_management/main_export.dart';
import 'package:user_management/src/ui/navigation_layout/cubit/listening_rail_navigation_cubit.dart';

enum BottomRouting implements Comparable<BottomRouting> {
  users,
  group,
  settings;

  const BottomRouting();

  String getName(BuildContext context) {
    switch (this) {
      case BottomRouting.users:
        return context.l10n.users;
      case BottomRouting.group:
        return context.l10n.groups;
      case BottomRouting.settings:
        return context.l10n.settings;
    }
  }

  IconData getIcon() {
    switch (this) {
      case BottomRouting.users:
        return Icons.people;
      case BottomRouting.group:
        return Icons.book;
      case BottomRouting.settings:
        return Icons.settings;
    }
  }

  IconData getSelectedIcon() {
    switch (this) {
      case BottomRouting.users:
        return Icons.people_alt_outlined;
      case BottomRouting.group:
        return Icons.book_online;
      case BottomRouting.settings:
        return Icons.settings;
    }
  }

  @override
  int compareTo(BottomRouting other) {
    return index.compareTo(other.index);
  }
}

class NavigationLayout extends StatefulWidget {
  const NavigationLayout({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<NavigationLayout> createState() => _NavigationLayoutState();
}

class _NavigationLayoutState extends State<NavigationLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: widget.navigationShell.currentIndex,
            onDestinationSelected: (int index) {
              widget.navigationShell.goBranch(index);
              final destination = BottomRouting.values.elementAt(index);
              context
                  .read<ListeningRailNavigationCubit>()
                  .changeToUsers(destination);
            },
            labelType: NavigationRailLabelType.selected,
            destinations: BottomRouting.values.map((route) {
              return NavigationRailDestination(
                icon: Icon(route.getIcon()),
                selectedIcon: Icon(route.getSelectedIcon()),
                label: Text(route.getName(context)),
              );
            }).toList(),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: widget.navigationShell,
          ),
        ],
      ),
    );
  }
}
