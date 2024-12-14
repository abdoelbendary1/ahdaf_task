// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ahdaf_task/core/utils/failures/failures.dart';
import 'package:ahdaf_task/data/models/categoryDM/category_dm/category_dm.dart';
import 'package:ahdaf_task/data/models/sliders_dm/SlidersDM.dart';
import 'package:ahdaf_task/domain/entities/Sliders/sliders_entity/sliders_entity.dart';
import 'package:ahdaf_task/domain/entities/bestSellers/best_seller_entity/best_seller_entity.dart';
import 'package:ahdaf_task/domain/entities/offers/offers_entity/offers_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepositry {
  Future<Either<Failures, SlidersEntity>> getSliders();
  Future<Either<Failures, CategoryDM>> getCategories();
  Future<Either<Failures, OffersEntity>> getOffers();
  Future<Either<Failures, BestSellerEntity>> getBestSellers();
}
