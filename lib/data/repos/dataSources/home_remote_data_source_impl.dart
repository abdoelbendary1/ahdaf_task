import 'package:ahdaf_task/core/utils/failures/failures.dart';
import 'package:ahdaf_task/data/api/home/home_api_manager.dart';
import 'package:ahdaf_task/data/models/categoryDM/category_dm/category_dm.dart';
import 'package:ahdaf_task/domain/entities/Sliders/sliders_entity/sliders_entity.dart';
import 'package:ahdaf_task/domain/entities/bestSellers/best_seller_entity/best_seller_entity.dart';
import 'package:ahdaf_task/domain/entities/offers/offers_entity/offers_entity.dart';
import 'package:ahdaf_task/domain/repos/dataSource/home_remote_data_source.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

@injectable
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final HomeApiManager homeApiManager;

  HomeRemoteDataSourceImpl({required this.homeApiManager});

  @override
  Future<Either<Failures, SlidersEntity>> getSliders() async {
    var either = await homeApiManager.getSliders();
    return either.fold((failure) {
      return Left(failure);
    }, (response) {
      return right(response);
    });
  }

  @override
  Future<Either<Failures, CategoryDM>> getCategories() async {
    var either = await homeApiManager.getCategories();
    return either.fold((failure) {
      return Left(failure);
    }, (response) {
      return right(response);
    });
  }

  @override
  Future<Either<Failures, BestSellerEntity>> getBestSellers() async {
    var either = await homeApiManager.getBestSellers();
    return either.fold((failure) {
      return Left(failure);
    }, (response) {
      return right(response);
    });
  }

  @override
  Future<Either<Failures, OffersEntity>> getOffers() async {
    var either = await homeApiManager.getOffers();
    return either.fold((failure) {
      return Left(failure);
    }, (response) {
      return right(response);
    });
  }
}
