import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_management/core/routes.dart';
import 'package:user_management/core/routing_transition.dart';
import 'package:user_management/src/ui/group/group_screens.dart';
import 'package:user_management/src/ui/navigation_layout/navigation_layout.dart';
import 'package:user_management/src/ui/setting/settings_screen.dart';
import 'package:user_management/src/ui/users/users_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellSettingKey = GlobalKey<NavigatorState>();
final _shellGroupKey = GlobalKey<NavigatorState>();
final _shellUsersKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/users',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationLayout(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellUsersKey,
          routes: [
            GoRoute(
              path: '/users',
              name: RouteName.users,
              pageBuilder: (context, state) => RoutingTransition.fadeTransition(
                const UsersScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellGroupKey,
          routes: [
            GoRoute(
              path: '/groupUser',
              name: RouteName.groupUsers,
              pageBuilder: (context, state) => RoutingTransition.fadeTransition(
                const GroupScreens(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellSettingKey,
          routes: [
            GoRoute(
              path: '/setting',
              name: RouteName.setting,
              pageBuilder: (context, state) => RoutingTransition.fadeTransition(
                const SettingScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
