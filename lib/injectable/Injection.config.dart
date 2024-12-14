// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ahdaf_task/data/api/home/home_api_manager.dart' as _i471;
import 'package:ahdaf_task/data/repos/dataSources/home_remote_data_source_impl.dart'
    as _i86;
import 'package:ahdaf_task/data/repos/repositries/homeRepo_impl.dart' as _i982;
import 'package:ahdaf_task/domain/repos/dataSource/home_remote_data_source.dart'
    as _i720;
import 'package:ahdaf_task/domain/repos/repositries/home_repos.dart' as _i656;
import 'package:ahdaf_task/domain/usecases/fetchBestSellers_usecase.dart'
    as _i37;
import 'package:ahdaf_task/domain/usecases/fetchCategories_usecase.dart'
    as _i1071;
import 'package:ahdaf_task/domain/usecases/fetchOffers_usecase.dart' as _i209;
import 'package:ahdaf_task/domain/usecases/fetchSliders_usecase.dart' as _i241;
import 'package:ahdaf_task/injectable/module.dart' as _i58;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i471.HomeApiManager>(() => registerModule.homeApiManager);
    gh.singleton<_i720.HomeRemoteDataSource>(
        () => registerModule.homeRemoteDataSource);
    gh.singleton<_i656.HomeRepositry>(() => registerModule.homeRepository);
    gh.singleton<_i241.FetchSlidersUsecase>(
        () => registerModule.fetchSlidersUsecase);
    gh.factory<_i86.HomeRemoteDataSourceImpl>(() =>
        _i86.HomeRemoteDataSourceImpl(
            homeApiManager: gh<_i471.HomeApiManager>()));
    gh.factory<_i37.FetchBestSellerUsecase>(
      () =>
          _i37.FetchBestSellerUsecase(homeRepositry: gh<_i656.HomeRepositry>()),
      registerFor: {_prod},
    );
    gh.factory<_i1071.FetchCategoriesUsecase>(
      () => _i1071.FetchCategoriesUsecase(
          homeRepositry: gh<_i656.HomeRepositry>()),
      registerFor: {_prod},
    );
    gh.factory<_i209.FetchOffersUsecase>(
      () => _i209.FetchOffersUsecase(homeRepositry: gh<_i656.HomeRepositry>()),
      registerFor: {_prod},
    );
    
    gh.factory<_i982.HomeRepoImpl>(() => _i982.HomeRepoImpl(
        homeRemoteDataSource: gh<_i720.HomeRemoteDataSource>()));
   
    return this;
  }
}

class _$RegisterModule extends _i58.RegisterModule {}
