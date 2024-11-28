// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pixabay_flutter/core/data/api/interceptors/pixabay_auth_interceptor.dart'
    as _i541;
import 'package:pixabay_flutter/core/data/api/schemes/api.dart' as _i0;
import 'package:pixabay_flutter/core/data/di/modules/api_module.dart' as _i391;
import 'package:pixabay_flutter/core/data/di/modules/app_module.dart' as _i160;
import 'package:pixabay_flutter/features/pixabay/core/data/source/pixabay_data_source.dart'
    as _i733;
import 'package:pixabay_flutter/features/pixabay/core/domain/usecases/get_pixabay_images_usecase.dart'
    as _i974;
import 'package:pixabay_flutter/features/pixabay/core/domain/usecases/get_pixabay_item_usecase.dart'
    as _i844;
import 'package:pixabay_flutter/features/pixabay/core/domain/usecases/search_pixabay_images_usecase.dart'
    as _i441;
import 'package:pixabay_flutter/features/pixabay/details/presentation/bloc/pixabay_image_details_bloc.dart'
    as _i756;
import 'package:pixabay_flutter/features/pixabay/discover/presentation/bloc/discover_bloc.dart'
    as _i258;
import 'package:pixabay_flutter/features/pixabay/search/presentation/bloc/pixabay_search_bloc.dart'
    as _i694;
import 'package:pixabay_flutter/features/settings/core/data/repositories/laguage_repository_impl.dart'
    as _i289;
import 'package:pixabay_flutter/features/settings/core/data/repositories/theme_repository_impl.dart'
    as _i707;
import 'package:pixabay_flutter/features/settings/core/domain/repositories/language_repository.dart'
    as _i67;
import 'package:pixabay_flutter/features/settings/core/domain/repositories/theme_repository.dart'
    as _i259;
import 'package:pixabay_flutter/features/settings/core/presentation/blocs/global_settings_bloc.dart'
    as _i578;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> $initMainGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiModule = _$ApiModule();
    final appModule = _$AppModule();
    gh.factory<_i519.Client>(() => apiModule.resolveHttpClient);
    gh.factory<_i541.PixabayAuthInterceptor>(
        () => apiModule.resolvePixabayAuthInterceptor());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    await gh.factoryAsync<_i558.FlutterSecureStorage>(
      () => appModule.secureStorage,
      preResolve: true,
    );
    gh.lazySingleton<_i67.LanguageRepository>(
        () => _i289.LanguageRepositoryImpl(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i259.ThemeRepository>(
        () => _i707.ThemeRepositoryImpl(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i578.GlobalSettingsBloc>(() => _i578.GlobalSettingsBloc(
          gh<_i67.LanguageRepository>(),
          gh<_i259.ThemeRepository>(),
        ));
    gh.factory<_i361.Dio>(
        () => apiModule.resolveDio(gh<_i541.PixabayAuthInterceptor>()));
    gh.factory<String>(
      () => apiModule.resolveBaseUrl(),
      instanceName: 'BaseUrl',
    );
    gh.singleton<_i0.Api>(() => apiModule.resolveApi(
          gh<_i361.Dio>(),
          gh<String>(instanceName: 'BaseUrl'),
        ));
    gh.factory<_i733.PixabayDataSource>(
        () => _i733.PixabayDataSource(gh<_i0.Api>()));
    gh.factory<_i974.GetPixabayImagesUsecase>(
        () => _i974.GetPixabayImagesUsecase(gh<_i733.PixabayDataSource>()));
    gh.factory<_i844.GetPixabayImageUsecase>(
        () => _i844.GetPixabayImageUsecase(gh<_i733.PixabayDataSource>()));
    gh.factory<_i441.SearchPixabayImagesUsecase>(
        () => _i441.SearchPixabayImagesUsecase(gh<_i733.PixabayDataSource>()));
    gh.factory<_i756.PixabayImageDetailsBloc>(() =>
        _i756.PixabayImageDetailsBloc(gh<_i844.GetPixabayImageUsecase>()));
    gh.factory<_i258.DiscoverBloc>(
        () => _i258.DiscoverBloc(gh<_i974.GetPixabayImagesUsecase>()));
    gh.factory<_i694.PixabaySearchBloc>(
        () => _i694.PixabaySearchBloc(gh<_i441.SearchPixabayImagesUsecase>()));
    return this;
  }
}

class _$ApiModule extends _i391.ApiModule {}

class _$AppModule extends _i160.AppModule {}
