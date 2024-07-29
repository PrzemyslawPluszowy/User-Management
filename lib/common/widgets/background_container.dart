import 'package:flutter/material.dart';
import 'package:user_management/utils/extension/context_color.dart';

class BackGroundContainer extends StatelessWidget {
  const BackGroundContainer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            context.colorScheme.primaryContainer.withOpacity(0.4),
            context.colorScheme.primary.withOpacity(0.02),
            context.colorScheme.primary.withOpacity(0),
          ],
        ),
      ),
      child: child,
    );
  }
}
