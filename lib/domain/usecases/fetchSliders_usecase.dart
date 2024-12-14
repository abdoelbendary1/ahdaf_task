// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ahdaf_task/core/utils/failures/failures.dart';
import 'package:ahdaf_task/domain/entities/Sliders/sliders_entity/sliders_entity.dart';
import 'package:ahdaf_task/domain/repos/repositries/home_repos.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

@injectable
@Environment('prod')
class FetchSlidersUsecase {
  final HomeRepositry homeRepositry;

  FetchSlidersUsecase({required this.homeRepositry});

  Future<Either<Failures, SlidersEntity>> call() {
    return homeRepositry.getSliders();
  }
}
