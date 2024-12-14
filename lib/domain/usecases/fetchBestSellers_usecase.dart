import 'package:ahdaf_task/core/utils/failures/failures.dart';
import 'package:ahdaf_task/domain/entities/bestSellers/best_seller_entity/best_seller_entity.dart';
import 'package:ahdaf_task/domain/entities/offers/offers_entity/offers_entity.dart';
import 'package:ahdaf_task/domain/repos/repositries/home_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
@Environment('prod')
class FetchBestSellerUsecase {
  final HomeRepositry homeRepositry;

  FetchBestSellerUsecase({required this.homeRepositry});

  Future<Either<Failures, BestSellerEntity>> call() {
    return homeRepositry.getBestSellers();
  }
}
