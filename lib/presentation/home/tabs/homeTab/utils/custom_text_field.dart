import 'package:ahdaf_task/core/constants/my_assets.dart';
import 'package:ahdaf_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        /*   if (value.isNotEmpty) {
          HomeTabViewModel.get(context).search(value);
        } else {
          HomeTabViewModel.get(context).getHomeData();
        } */
      },
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.whiteColor,
          contentPadding: EdgeInsets.all(15.h),
          hintText: "بحث",
          hintStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.blackColor),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.search,
              size: 32.sp,
              color: AppColors.primaryColor.withOpacity(0.75),
            ),
            onPressed: () {},
          ),
          suffixIcon: ImageIcon(
            size: 40.sp,
            const AssetImage(
              MyAssets.notSelectedCategoryIcon,
            ),
          ),
          border: buildBaseBorder(),
          enabledBorder: buildBaseBorder(),
          focusedBorder: buildBaseBorder().copyWith(
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 1))),
    );
  }

  OutlineInputBorder buildBaseBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 0),
    );
  }
}
