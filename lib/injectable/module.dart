import 'package:ahdaf_task/data/api/home/home_api_manager.dart';
import 'package:ahdaf_task/data/repos/dataSources/home_remote_data_source_impl.dart';
import 'package:ahdaf_task/data/repos/repositries/homeRepo_impl.dart';
import 'package:ahdaf_task/domain/repos/dataSource/home_remote_data_source.dart';
import 'package:ahdaf_task/domain/repos/repositries/home_repos.dart';
import 'package:ahdaf_task/domain/usecases/fetchBestSellers_usecase.dart';
import 'package:ahdaf_task/domain/usecases/fetchCategories_usecase.dart';
import 'package:ahdaf_task/domain/usecases/fetchOffers_usecase.dart';
import 'package:ahdaf_task/domain/usecases/fetchSliders_usecase.dart';
import 'package:ahdaf_task/injectable/Injection.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  // Register HomeApiManager, HomeRemoteDataSource, HomeRepoImpl, and FetchSlidersUsecase
  @singleton
  HomeApiManager get homeApiManager => HomeApiManager();

  @singleton
  HomeRemoteDataSource get homeRemoteDataSource => HomeRemoteDataSourceImpl(
        homeApiManager: getIt<HomeApiManager>(),
      );

  @singleton
  HomeRepositry get homeRepository => HomeRepoImpl(
        homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
      );

  @singleton
  FetchSlidersUsecase get fetchSlidersUsecase => FetchSlidersUsecase(
        homeRepositry: getIt<HomeRepositry>(),
      );
  @singleton
  FetchCategoriesUsecase get fetchCategoriesUsecase => FetchCategoriesUsecase(
        homeRepositry: getIt<HomeRepositry>(),
      );
  @singleton
  FetchOffersUsecase get fetchOffersUsecase => FetchOffersUsecase(
        homeRepositry: getIt<HomeRepositry>(),
      );
  @singleton
  FetchBestSellerUsecase get fetchBestSellerUsecase => FetchBestSellerUsecase(
        homeRepositry: getIt<HomeRepositry>(),
      );
}
