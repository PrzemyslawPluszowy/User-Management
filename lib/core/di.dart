import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:user_management/src/data/api/postal_code_repository.dart';
import 'package:user_management/src/data/local/drift_repository.dart';
import 'package:user_management/src/services/group_service.dart';
import 'package:user_management/src/services/users_service.dart';

final getIt = GetIt.instance;

void initDi() {
  //register and setup dio
  getIt
    ..registerLazySingleton<Dio>(
      () => Dio()
        ..interceptors.add(InterceptorsWrapper())
        ..options = BaseOptions(
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json',
          },
        )
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
          ),
        ),
    )
    ..registerLazySingleton<PostalCodeRepository>(
      () => PostalCodeRepository(getIt<Dio>()),
    )
    ..registerLazySingleton<DriftRepository>(
      DriftRepository.new,
    )
    ..registerLazySingleton<UserService>(
      () => UserService(
        driftDb: getIt.call(),
      ),
    )
    ..registerLazySingleton<GroupService>(
      () => GroupService(
        userService: getIt.call(),
        driftDb: getIt.call(),
      ),
    );
}
