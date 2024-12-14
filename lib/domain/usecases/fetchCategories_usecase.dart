import 'package:ahdaf_task/core/utils/failures/failures.dart';
import 'package:ahdaf_task/domain/entities/categoryEntity/category_entity/category_entity.dart';
import 'package:ahdaf_task/domain/repos/repositries/home_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
@Environment('prod')
class FetchCategoriesUsecase {
  final HomeRepositry homeRepositry;

  FetchCategoriesUsecase({required this.homeRepositry});

  Future<Either<Failures, CategoryEntity>> call() {
    return homeRepositry.getCategories();
  }
}
