import 'package:ahdaf_task/domain/entities/categoryEntity/category_entity/CategoryData.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryData? categoryData;

  CategoryWidget({required this.categoryData});

  @override
  Widget build(BuildContext context) {
    // If category data is available, display the actual widget
    if (categoryData != null) {
      return _buildCategoryContent(categoryData!);
    } else {
      // Show shimmer effect when loading
      return _buildShimmerLoading();
    }
  }

  // Widget for displaying the category when data is loaded
  Widget _buildCategoryContent(CategoryData categoryData) {
    return Column(
      children: [
        CircleAvatar(
          onBackgroundImageError: (exception, stackTrace) {
            print('Error loading image: $exception');
          },
          backgroundImage: NetworkImage(categoryData.image ?? ""),
          radius: 30,
          backgroundColor: Colors.orange[100],
          child: const Icon(Icons.category, color: Colors.orange),
        ),
        const SizedBox(height: 8),
        Text(
          categoryData.name?.ar ?? "",
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  // Shimmer loading effect when data is not available (loading state)
  Widget _buildShimmerLoading() {
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
}
