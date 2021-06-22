// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data/auth_api.dart' as _i4;
import '../../features/auth/domain/auth_repository.dart' as _i5;
import 'modules.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.dio);
  gh.singleton<_i4.AuthApiClient>(_i4.AuthApiClient(get<_i3.Dio>()));
  gh.singleton<_i5.AuthRepository>(
      _i5.AuthRepositoryImpl(get<_i4.AuthApiClient>()));
  return get;
}

class _$RegisterModule extends _i6.RegisterModule {}
