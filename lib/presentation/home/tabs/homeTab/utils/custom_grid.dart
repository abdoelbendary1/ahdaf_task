import 'package:ahdaf_task/data/models/offers/offers_dm/offerData.dart';
import 'package:ahdaf_task/domain/entities/bestSellers/best_seller_entity/datum.dart';
import 'package:ahdaf_task/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ahdaf_task/presentation/home/tabs/homeTab/utils/grid_view.dart';

class CustomGridView<T> extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;
  final double childAspectRatio;
  final List<T> products;
  final Function(int) onItemTap;

  const CustomGridView({
    super.key,
    required this.itemCount,
    required this.crossAxisCount,
    required this.childAspectRatio,
    required this.products,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 8.h,
      ),
      itemBuilder: (context, index) {
        final productEntity = _getProductEntity(products[index]);

        return InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            onItemTap(index);
          },
          child: GridViewCardItem(
            product: productEntity, // Pass ProductEntity to the GridViewCardItem
          ),
        );
      },
    );
  }

  // Function to extract ProductEntity from both OffersData and BestSellersData
  ProductEntity? _getProductEntity(T product) {
    if (product is OffersData) {
      return product.product; // Assuming OffersData contains ProductEntity
    } else if (product is BestSellerData) {
      return product.product; // Assuming BestSellersData contains ProductEntity
    } else {
      throw Exception('Unknown product type');
    }
  }
}
