import 'package:ahdaf_task/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ahdaf_task/core/theme/app_colors.dart';

class GridViewCardItem extends StatelessWidget {
  final ProductEntity? product;

  const GridViewCardItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ProductImageWithDiscount(product: product ?? ProductEntity()),
        SizedBox(height: 4.h),
        _ProductCategory(product: product ?? ProductEntity()),
        SizedBox(height: 4.h),
        _ProductName(product: product ?? ProductEntity()),
        SizedBox(height: 4.h),
        _ProductPrice(product: product ?? ProductEntity()),
        SizedBox(height: 4.h),
        _ProductRating(product: product ?? ProductEntity()),
      ],
    );
  }
}

class _ProductImageWithDiscount extends StatelessWidget {
  final ProductEntity product;

  const _ProductImageWithDiscount({required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Product Image
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: SizedBox(
            width: 190.w,
            height: 160.h,
            child: Image.asset(
              product.image ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 190.w,
                height: 160.h,
                color: Colors.grey.shade300,
                child: Icon(
                  Icons.broken_image,
                  color: Colors.grey,
                  size: 50.sp,
                ),
              ),
            ),
          ),
        ),

        // discountOffer Badge
        if (product.discountOffer != null && product.discountOffer! > 0)
          Positioned(
            top: 0.h,
            right: 0.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.h),
                  bottomLeft: Radius.circular(10.h),
                ),
              ),
              child: Text(
                // Calculate discount percentage
                '${(((product.discountOffer ?? 0) / (product.price ?? 1)) * 100).toStringAsFixed(0)} % خصم',

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _ProductCategory extends StatelessWidget {
  final ProductEntity product;

  const _ProductCategory({required this.product});

  @override
  Widget build(BuildContext context) {
    return Text(
      product.category ?? '',
      style: TextStyle(
        color: AppColors.greyColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _ProductName extends StatelessWidget {
  final ProductEntity product;

  const _ProductName({required this.product});

  @override
  Widget build(BuildContext context) {
    return Text(
      product.name ?? '',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.darkPrimaryColor,
      ),
    );
  }
}

class _ProductPrice extends StatelessWidget {
  final ProductEntity product;

  const _ProductPrice({required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Discounted Price
        Text(
          'EGP ${product.sale?.toStringAsFixed(2) ?? ''}',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(width: 8.w),

        // Original Price with Strikethrough
        if (product.sale != null)
          Text(
            'EGP ${product.price?.toStringAsFixed(2) ?? ''}',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.lightGreyColor,
              decoration: TextDecoration.lineThrough,
            ),
          ),
      ],
    );
  }
}

class _ProductRating extends StatelessWidget {
  final ProductEntity product;

  const _ProductRating({required this.product});

  @override
  Widget build(BuildContext context) {
    print(product.rating);
    return Row(
      children: [
        for (double i = 0;
            i < (double.tryParse(product.rating ?? "0") ?? 0);
            i++)
          Icon(Icons.star, color: Colors.amber, size: 14.sp),
        for (double i = (double.tryParse(product.rating ?? "0") ?? 0);
            i < 5;
            i++)
          Icon(Icons.star_border, color: Colors.amber, size: 14.sp),
      ],
    );
  }
}
