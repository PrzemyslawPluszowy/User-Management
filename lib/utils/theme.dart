import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_management/src/ui/setting/cubit/theme_logic_cubit.dart';
import 'package:user_management/utils/ui.dart';

class ThemeFlex {
  static ThemeData flexThemeLight(ThemeLogicState state) {
    return FlexThemeData.light(
      scheme: state.scheme,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 9,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: GoogleFonts.nunito().fontFamily,
    ).copyWith(
      brightness: Brightness.light,
      inputDecorationTheme: _inputDecorationLight(),
      filledButtonTheme: _filledButtonThemeLight(),
    );
  }

  static ThemeData flexThemeDark(ThemeLogicState state) {
    return FlexThemeData.dark(
      scheme: state.scheme,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 9,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: GoogleFonts.nunito().fontFamily,
    ).copyWith(
      brightness: Brightness.dark,
      inputDecorationTheme: _inputDecorationDark(),
      filledButtonTheme: _filledButtonThemeDark(),
    );
  }

  static FilledButtonThemeData _filledButtonThemeLight() {
    return FilledButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(30, 56)),
        elevation: WidgetStateProperty.all(4),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: Ui.borderRadiusLarge,
          ),
        ),
      ),
    );
  }

  static FilledButtonThemeData _filledButtonThemeDark() {
    return FilledButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(30, 56)),
        elevation: WidgetStateProperty.all(4),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: Ui.borderRadiusLarge,
          ),
        ),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationLight() {
    return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      activeIndicatorBorder: BorderSide.none,

      filled: true,
      fillColor: FlexColorScheme.light().surface,
      disabledBorder: OutlineInputBorder(
        borderRadius: Ui.borderRadiusLarge,
        borderSide: const BorderSide(
          style: BorderStyle.none,
          width: 0,
          color: Colors.transparent,
        ),
      ),
      border: InputBorder.none, // Ustawiamy brak obramowania
    );
  }

  static InputDecorationTheme _inputDecorationDark() {
    return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      activeIndicatorBorder: BorderSide.none,
      filled: true,
      fillColor: FlexColorScheme.dark().surface,
      disabledBorder: OutlineInputBorder(
        borderRadius: Ui.borderRadiusLarge,
        borderSide: const BorderSide(
          style: BorderStyle.none,
          width: 0,
          color: Colors.transparent,
        ),
      ),
      border: InputBorder.none,
    );
  }
}
