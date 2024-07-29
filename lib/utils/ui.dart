import 'package:flutter/material.dart';
import 'package:user_management/utils/extension/context_color.dart';

class Ui {
  static const double defaultButtonHeight = 60;
  static const double bottomNavigationBarHeight = 80;

  static const double defaultPaddingVertical = 36;
  static const double defaultPaddingHorizontal = 24;

  static final BorderRadius borderRadiusLarge = BorderRadius.circular(15);
  static final BorderRadius borderRadiusMedium = BorderRadius.circular(10);
  static final BorderRadius borderRadiusSmall = BorderRadius.circular(5);

  static const double defaultElevation = 5;

  static const EdgeInsetsGeometry marginLarge = EdgeInsets.all(16);
  static const EdgeInsetsGeometry marginMedium = EdgeInsets.all(8);
  static const EdgeInsetsGeometry marginSmall = EdgeInsets.all(4);
  static const double marginLargeOnly = 16;
  static const double marginMediumOnly = 8;
  static const double marginSmallOnly = 4;

  static const EdgeInsetsGeometry paddingLarge = EdgeInsets.all(16);
  static const EdgeInsetsGeometry paddingMedium = EdgeInsets.all(8);
  static const EdgeInsetsGeometry paddingSmall = EdgeInsets.all(4);
  static const double paddingLargeOnly = 16;
  static const double paddingMediumOnly = 8;
  static const double paddingSmallOnly = 4;

  static const horizontalPadding =
      EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal);
  static const verticalPadding =
      EdgeInsets.symmetric(vertical: defaultPaddingVertical);

  static const double logoSize = 250;

  static SizedBox get hNormal => const SizedBox(height: 16);
  static SizedBox get hSmall => const SizedBox(height: 8);
  static SizedBox get wNormal => const SizedBox(width: 8);
  static SizedBox get wSmall => const SizedBox(width: 4);

  static const Duration durationShort = Duration(milliseconds: 300);
  static const Duration durationMedium = Duration(milliseconds: 500);
  static const Duration durationLong = Duration(milliseconds: 1000);
  static const Duration durationVeryLong = Duration(milliseconds: 2000);

  static const double iconSizeSmall = 20;
  static const double iconSize = 24;
  static const double iconSizeMedium = 28;
  static const double iconSizeLarge = 36;
  static const double iconSizeExtraLarge = 60;
  //
  static const double customAppBarHeight = 60;

  static BoxShadow shadowText(BuildContext context) => BoxShadow(
        color: context.colorScheme.primary.withOpacity(0.2),
        blurRadius: 5,
        offset: const Offset(0, 3),
        spreadRadius: 1,
      );

  static BoxDecoration boxDecoration(BuildContext context) => BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: borderRadiusLarge,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: context.colorScheme.onSurface.withOpacity(0.2),
          ),
        ],
      );
  static InputDecoration decryptionsTextFormDecoration(
    BuildContext context, {
    String? hintText,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: context.colorScheme.primary,
        ),
      ),
      hintText: hintText,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: context.colorScheme.primary,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: context.colorScheme.primary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: context.colorScheme.error,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: context.colorScheme.error,
        ),
      ),
    );
  }

  static InputDecoration dropDownDecoration(BuildContext context) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: context.colorScheme.primary,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: context.colorScheme.primary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: context.colorScheme.error,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: context.colorScheme.error,
        ),
      ),
    );
  }
}
