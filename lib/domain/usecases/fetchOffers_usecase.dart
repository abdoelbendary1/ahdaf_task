import 'package:ahdaf_task/core/utils/failures/failures.dart';
import 'package:ahdaf_task/domain/entities/offers/offers_entity/offers_entity.dart';
import 'package:ahdaf_task/domain/repos/repositries/home_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
@Environment('prod')
class FetchOffersUsecase {
  final HomeRepositry homeRepositry;

  FetchOffersUsecase({required this.homeRepositry});

  Future<Either<Failures, OffersEntity>> call() {
    return homeRepositry.getOffers();
  }
}
