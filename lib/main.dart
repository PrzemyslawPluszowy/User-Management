import 'dart:io';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_management/main_export.dart';
import 'package:user_management/src/ui/setting/cubit/theme_logic_cubit.dart';
import 'package:window_manager/window_manager.dart';

final logE = Talker(
  settings: TalkerSettings(),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDi();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await windowManager.ensureInitialized();

    const windowOptions = WindowOptions(
      size: Config.minimumScreenSize,
      minimumSize: Config.minimumScreenSize,
      maximumSize: Config.maximumScreenSize,
      center: true,
      windowButtonVisibility: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
      title: '${Config.appName} ',
    );
    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      await windowManager.setBackgroundColor(Colors.transparent);
    });
  }

  runApp(const UserManagement());
}

class UserManagement extends StatelessWidget {
  const UserManagement({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Providers.getBlocProviders(),
      child: BlocBuilder<ThemeLogicCubit, ThemeLogicState>(
        builder: (context, state) {
          return MaterialApp.router(
            themeMode: state.mode,
            darkTheme: ThemeFlex.flexThemeDark(state),
            theme: ThemeFlex.flexThemeLight(state),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: L10n.all,
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            title: Config.appName,
          );
        },
      ),
    );
  }
}
