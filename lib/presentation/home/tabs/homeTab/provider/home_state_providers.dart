import 'package:ahdaf_task/presentation/home/tabs/homeTab/provider/home_states.dart';
import 'package:ahdaf_task/presentation/home/tabs/homeTab/provider/home_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(),
);
final sliderProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(),
);
final categoriesProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(),
);
final offersProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(),
);
final bestSellersProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(),
);
