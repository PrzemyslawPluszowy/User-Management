part of 'theme_logic_cubit.dart';

@freezed
class ThemeLogicState with _$ThemeLogicState {
  const factory ThemeLogicState.changeTheme(
    FlexScheme scheme,
    ThemeMode mode,
  ) = _ChangeTheme;
}
