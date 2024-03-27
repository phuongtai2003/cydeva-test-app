// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data_repository/login_data_repository.dart' as _i4;
import '../service/login_service.dart' as _i5;
import '../service/otp_service.dart' as _i6;
import 'di_config.dart' as _i7;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.Dio>(() => appModule.dio);
  gh.lazySingleton<_i4.LoginDataRepository>(
      () => appModule.loginDataRepository);
  gh.lazySingleton<_i5.LoginService>(
      () => _i5.LoginService(gh<_i4.LoginDataRepository>()));
  gh.lazySingleton<_i6.OtpService>(
      () => _i6.OtpService(gh<_i4.LoginDataRepository>()));
  return getIt;
}

class _$AppModule extends _i7.AppModule {}
