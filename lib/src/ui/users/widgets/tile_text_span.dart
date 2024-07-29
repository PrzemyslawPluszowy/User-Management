import 'package:flutter/material.dart';
import 'package:user_management/utils/extension/context_color.dart';

class TileTextSpan extends StatelessWidget {
  const TileTextSpan({
    required this.firstField,
    required this.secondField,
    super.key,
  });

  final String firstField;
  final String secondField;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$firstField ',
        style: TextStyle(
          color: context.colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: secondField,
            style: TextStyle(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
