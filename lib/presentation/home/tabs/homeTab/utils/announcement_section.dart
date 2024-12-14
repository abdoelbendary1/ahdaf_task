// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ahdaf_task/core/theme/app_colors.dart';
import 'package:ahdaf_task/domain/entities/Sliders/sliders_entity/slider_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnnouncementsSection extends StatelessWidget {
  final List<SliderDataEntity?> sliderImages;

  const AnnouncementsSection({
    super.key,
    required this.sliderImages,
  });

  @override
  Widget build(BuildContext context) {
    // Prevent error if sliderImages is empty
    if (sliderImages.isEmpty) {
      return const Center(child: Text('No announcements available'));
    }

    return ImageSlideshow(
      height: 200.h,
      initialPage: 0,
      indicatorColor: AppColors.primaryColor,
      indicatorBackgroundColor: AppColors.whiteColor,
      indicatorBottomPadding: 20.h,
      autoPlayInterval: 3000,
      isLoop: true,
      children: sliderImages.map((banner) {
        if (banner == null || banner.image == null) {
          return Container(
            width: 190.w,
            height: 160.h,
            color: Colors.grey.shade300,
            child: Icon(
              Icons.broken_image,
              color: Colors.grey,
              size: 50.sp,
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            banner.image!,
            fit: BoxFit.fill,
            width: 398.w,
            height: 200.h,
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
        );
      }).toList(),
    );
  }
}
