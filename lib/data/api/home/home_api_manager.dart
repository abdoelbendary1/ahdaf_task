import 'package:ahdaf_task/core/constants/api_constants/api_constants.dart';
import 'package:ahdaf_task/core/enums/http_methods.dart';
import 'package:ahdaf_task/core/helpers/api_helper.dart';
import 'package:ahdaf_task/core/utils/failures/failures.dart';
import 'package:ahdaf_task/data/models/bestSeller/best_sellerDM.dart';
import 'package:ahdaf_task/data/models/categoryDM/category_dm/category_dm.dart';
import 'package:ahdaf_task/data/models/offers/offers_dm/offers_dm.dart';
import 'package:ahdaf_task/data/models/sliders_dm/SlidersDM.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

@injectable
@Environment('prod')
class HomeApiManager {
  final ApiHelperHttp apiHelperHttp = ApiHelperHttp();
  final ApiHelperDio apiHelperDio = ApiHelperDio();

  Future<Either<Failures, SlidersDM>> getSliders() async {
    return await apiHelperHttp.makeRequest<SlidersDM>(
      endpoint: ApiConstants.sliders,
      baseUrl: ApiConstants.baseUrl,
      method: HttpMethod.GET,
      parseResponse: (responseBody) {
        return SlidersDM.fromJson(responseBody);
      },
    );
  }

  Future<Either<Failures, CategoryDM>> getCategories() async {
    return await apiHelperHttp.makeRequest<CategoryDM>(
      endpoint: ApiConstants.categories,
      baseUrl: ApiConstants.baseUrl,
      method: HttpMethod.GET,
      parseResponse: (responseBody) {
        return CategoryDM.fromJson(responseBody);
      },
    );
  }

  Future<Either<Failures, OffersDM>> getOffers() async {
    return await apiHelperHttp.makeRequest<OffersDM>(
      endpoint: ApiConstants.offers,
      baseUrl: ApiConstants.baseUrl,
      method: HttpMethod.GET,
      parseResponse: (responseBody) {
        return OffersDM.fromJson(responseBody);
      },
    );
  }

  Future<Either<Failures, BestSellerDM>> getBestSellers() async {
    return await apiHelperHttp.makeRequest<BestSellerDM>(
      endpoint: ApiConstants.bestSellingProducts,
      baseUrl: ApiConstants.baseUrl,
      method: HttpMethod.GET,
      parseResponse: (responseBody) {
        return BestSellerDM.fromJson(responseBody);
      },
    );
  }
}
