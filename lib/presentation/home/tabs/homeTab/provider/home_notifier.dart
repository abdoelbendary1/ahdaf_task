import 'package:ahdaf_task/domain/usecases/fetchBestSellers_usecase.dart';
import 'package:ahdaf_task/domain/usecases/fetchCategories_usecase.dart';
import 'package:ahdaf_task/domain/usecases/fetchOffers_usecase.dart';
import 'package:ahdaf_task/domain/usecases/fetchSliders_usecase.dart';
import 'package:ahdaf_task/injectable/Injection.dart';
import 'package:ahdaf_task/presentation/home/tabs/homeTab/provider/home_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier()
      : super(HomeState(isLoading: false, isError: false, errorMessage: ""));
  final fetchSlidersUsecase = getIt<FetchSlidersUsecase>();
  final fetchCategoriesUsecase = getIt<FetchCategoriesUsecase>();
  final fetchOffersUsecase = getIt<FetchOffersUsecase>();
  final fetchBestSellerUsecase = getIt<FetchBestSellerUsecase>();

  Future<void> fetchSliders() async {
    try {
      state = state.copyWith(
          isLoading: true, isError: false); // Set loading to true
      var sliders = await fetchSlidersUsecase.call();
      sliders.fold(
        (failure) {
          state = SliderState(
            isLoading: false,
            isError: true,
            errorMessage: failure.errorMessege,
            data: [],
          );
        },
        (response) {
          state = SliderState(
            isLoading: false,
            isError: false,
            errorMessage: "",
            data: response.data ?? [],
          );
        },
      );
    } catch (error) {
      state = SliderState(
        isLoading: false,
        isError: true,
        errorMessage: error.toString(),
        data: [],
      );
    }
  }

  Future<void> fetchCategories() async {
    try {
      state = state.copyWith(
          isLoading: true, isError: false); // Set loading to true
      var categories = await fetchCategoriesUsecase.call();
      categories.fold(
        (failure) {
          state = CategoryState(
            isLoading: false,
            isError: true,
            errorMessage: failure.errorMessege,
            data: [],
          );
        },
        (response) {
          state = CategoryState(
            isLoading: false,
            isError: false,
            errorMessage: "",
            data: response.data ?? [],
          );
        },
      );
    } catch (error) {
      state = CategoryState(
        isLoading: false,
        isError: true,
        errorMessage: 'Failed to fetch categories',
        data: [],
      );
    }
  }

  Future<void> fetchOffers() async {
    try {
      state = state.copyWith(
          isLoading: true, isError: false); // Set loading to true
      var categories = await fetchOffersUsecase.call();
      categories.fold(
        (failure) {
          state = OffersState(
            isLoading: false,
            isError: true,
            errorMessage: failure.errorMessege,
            data: [],
          );
        },
        (response) {
          state = OffersState(
            isLoading: false,
            isError: false,
            errorMessage: "",
            data: response.data ?? [],
          );
        },
      );
    } catch (error) {
      state = OffersState(
        isLoading: false,
        isError: true,
        errorMessage: 'Failed to fetch categories',
        data: [],
      );
    }
  }

  Future<void> fetchBestSellers() async {
    try {
      state = state.copyWith(
          isLoading: true, isError: false); // Set loading to true
      var categories = await fetchBestSellerUsecase.call();
      categories.fold(
        (failure) {
          state = BestSellersState(
            isLoading: false,
            isError: true,
            errorMessage: failure.errorMessege,
            data: [],
          );
        },
        (response) {
          state = BestSellersState(
            isLoading: false,
            isError: false,
            errorMessage: "",
            data: response.data ?? [],
          );
        },
      );
    } catch (error) {
      state = BestSellersState(
        isLoading: false,
        isError: true,
        errorMessage: 'Failed to fetch categories',
        data: [],
      );
    }
  }
}
