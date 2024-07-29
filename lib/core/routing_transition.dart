import 'package:user_management/main_export.dart';

class RoutingTransition {
  static CustomTransitionPage<Widget> slideTransitionDialog(Widget screen) {
    return CustomTransitionPage<Widget>(
      transitionDuration: Durations.extralong1,
      fullscreenDialog: true,
      opaque: false,
      child: screen,
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  static CustomTransitionPage<Widget> fadeTransition(Widget screen) {
    return CustomTransitionPage<Widget>(
      transitionDuration: Durations.extralong1,
      child: screen,
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static CustomTransitionPage<Widget> slideTransition(Widget screen) {
    return CustomTransitionPage<Widget>(
      child: screen,
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}
