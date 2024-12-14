// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ahdaf_task/core/utils/failures/failures.dart';
import 'package:ahdaf_task/data/models/categoryDM/category_dm/category_dm.dart';
import 'package:ahdaf_task/domain/entities/Sliders/sliders_entity/sliders_entity.dart';
import 'package:ahdaf_task/domain/entities/bestSellers/best_seller_entity/best_seller_entity.dart';
import 'package:ahdaf_task/domain/entities/offers/offers_entity/offers_entity.dart';
import 'package:ahdaf_task/domain/repos/dataSource/home_remote_data_source.dart';
import 'package:ahdaf_task/domain/repos/repositries/home_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeRepoImpl implements HomeRepositry {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, SlidersEntity>> getSliders() async {
    return await homeRemoteDataSource.getSliders();
  }

  @override
  Future<Either<Failures, CategoryDM>> getCategories() async {
    return await homeRemoteDataSource.getCategories();
  }

  @override
  Future<Either<Failures, BestSellerEntity>> getBestSellers() async {
    return await homeRemoteDataSource.getBestSellers();
  }

  @override
  Future<Either<Failures, OffersEntity>> getOffers() async {
    return await homeRemoteDataSource.getOffers();
  }
}
