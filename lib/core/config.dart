import 'package:user_management/main_export.dart';

enum Environment { dev, prod }

class Config {
  static const String appName = 'User Management';

  static const Size minimumScreenSize = Size(1386, 768);
  static const Size maximumScreenSize = Size(2560, 1440);
}
