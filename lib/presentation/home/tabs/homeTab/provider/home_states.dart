// home_states.dart
import 'package:ahdaf_task/domain/entities/Sliders/sliders_entity/slider_data_entity.dart';
import 'package:ahdaf_task/domain/entities/categoryEntity/category_entity/CategoryData.dart';
import 'package:ahdaf_task/domain/entities/bestSellers/best_seller_entity/datum.dart';
import 'package:ahdaf_task/data/models/offers/offers_dm/offerData.dart';

class HomeState<T> {
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  final T? data;

  HomeState({
    required this.isLoading,
    required this.isError,
    required this.errorMessage,
    this.data,
  });

  HomeState<T> copyWith({
    bool? isLoading,
    bool? isError,
    String? errorMessage,
    T? data,
  }) {
    return HomeState<T>(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
    );
  }

  bool get isSuccess => !isLoading && !isError && data != null;
}

class SliderState extends HomeState<List<SliderDataEntity>> {
  SliderState({
    super.isLoading = false,
    super.isError = false,
    super.errorMessage = "",
    super.data,
  });
}

class CategoryState extends HomeState<List<CategoryData>> {
  CategoryState({
    super.isLoading = false,
    super.isError = false,
    super.errorMessage = "",
    super.data,
  });
}

class OffersState extends HomeState<List<OffersData>> {
  OffersState({
    super.isLoading = false,
    super.isError = false,
    super.errorMessage = "",
    super.data,
  });
}

class BestSellersState extends HomeState<List<BestSellerData>> {
  BestSellersState({
    super.isLoading = false,
    super.isError = false,
    super.errorMessage = "",
    super.data,
  });
}
