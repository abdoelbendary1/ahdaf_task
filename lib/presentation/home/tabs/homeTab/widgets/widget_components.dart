// General method to handle each section UI logic (loading, success, error)
import 'package:ahdaf_task/domain/entities/Sliders/sliders_entity/slider_data_entity.dart';
import 'package:ahdaf_task/presentation/home/tabs/homeTab/provider/home_states.dart';
import 'package:ahdaf_task/presentation/home/tabs/homeTab/utils/announcement_section.dart';
import 'package:ahdaf_task/presentation/home/tabs/homeTab/utils/custom_grid.dart';
import 'package:ahdaf_task/presentation/home/tabs/homeTab/widgets/cateogry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../domain/entities/categoryEntity/category_entity/CategoryData.dart';

class AppSpacing {
  static const double horizontalPadding = 16.0;
  static const double verticalSpacing = 16.0;
}

Widget buildSection<T>(HomeState<T> state,
    {required Widget Function(T data) onSuccess,
    required String errorMessage}) {
  if (state.isLoading) {
    return buildShimmerLoading(); // Shimmer effect for loading state
  } else if (state.isError) {
    return Center(
        child: Text(errorMessage)); // Show error message if there's an error
  } else if (state.isSuccess) {
    return onSuccess(
        state.data as T); // Return the UI for successful data loading
  }
  return const SizedBox
      .shrink(); // Return an empty widget in case of unknown state
}

// Shimmer loading widget (shutter loading effect)
Widget buildShimmerLoading() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      height: 180.h, // Adjust according to your layout
      width: double.infinity,
      color: Colors.white,
    ),
  );
}

Widget buildAnnouncementSection(List<SliderDataEntity?> sliders) {
  return AnnouncementsSection(sliderImages: sliders);
}

Widget buildCategoryShimmerLoading() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Column(
      children: [
        // Shimmer for CircleAvatar (image placeholder)
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[350], // Gray placeholder color
        ),
        const SizedBox(height: 8),
        // Shimmer for Text (category name placeholder)
        Container(
          width: 100,
          height: 12,
          color: Colors.grey[350],
        ),
      ],
    ),
  );
}

Widget buildCategories(List<CategoryData> categories) {
  return Padding(
    padding: EdgeInsets.all(AppSpacing.horizontalPadding.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: categories.map((category) {
        return CategoryWidget(categoryData: category);
      }).toList(),
    ),
  );
}

Widget buildGridView(List products) {
  return CustomGridView(
    itemCount: products.length < 4 ? products.length : 4,
    crossAxisCount: 2,
    childAspectRatio: 0.7,
    products: products,
    onItemTap: (index) async {
      print('Tapped on product $index');
    },
  );
}
