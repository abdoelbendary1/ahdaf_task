import 'package:ahdaf_task/core/constants/my_assets.dart';
import 'package:ahdaf_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCustomBottomNavigationBar(
    {required int selectedIndex,
    required Function(int) onTapFunction,
    required BuildContext context}) {
  return ClipRRect(
    /*  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.r),
      topRight: Radius.circular(20.r),
    ), */
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.orange,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: selectedIndex,
      onTap: onTapFunction,
      // selectedItemColor: Colors.transparent,
      // unselectedItemColor: Colors.transparent,
      items: [
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 0
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              backgroundColor: selectedIndex == 0
                  ? AppColors.whiteColor
                  : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                const AssetImage(
                  MyAssets.notSelectedHomeIcon,
                ),
              ),
            ),
            label: "HOME"),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 1
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              backgroundColor: selectedIndex == 1
                  ? AppColors.whiteColor
                  : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                const AssetImage(
                  MyAssets.notSelectedCategoryIcon,
                ),
              ),
            ),
            label: "CATEGORY"),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 1
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              backgroundColor: selectedIndex == 1
                  ? AppColors.whiteColor
                  : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                const AssetImage(
                  MyAssets.shoppingCart,
                ),
              ),
            ),
            label: "CART"),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 2
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              backgroundColor: selectedIndex == 2
                  ? AppColors.whiteColor
                  : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                const AssetImage(
                  MyAssets.notSelectedAccountIcon,
                ),
              ),
            ),
            label: "ACCOUNT")
      ],
    ),
  );
}
