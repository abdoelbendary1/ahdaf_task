import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ahdaf_task/core/theme/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor, // Background color (orange in image)
        borderRadius: BorderRadius.circular(30.r), // Rounded corners
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'بحث', // Placeholder text
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 14.sp,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Icon(
              Icons.filter_alt_outlined, // Icon on the left side (filter icon)
              color: Colors.white,
              size: 20.sp,
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Icon(
              Icons.search, // Icon on the right side (search icon)
              color: Colors.white,
              size: 20.sp,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
          border: InputBorder.none, // Remove default border
        ),
        style: TextStyle(
          fontSize: 16.sp,
          color: AppColors.darkPrimaryColor,
        ),
      ),
    );
  }
}
