import 'package:ahdaf_task/core/constants/my_assets.dart';
import 'package:ahdaf_task/core/theme/app_colors.dart';
import 'package:ahdaf_task/presentation/home/tabs/homeTab/utils/CustomSearchWithFilter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  final String greetingText;
  final String homeIconPath;
  final String accountIconPath;
  final EdgeInsetsGeometry padding;

  // Constructor to pass parameters
  const HeaderWidget({
    super.key,
    required this.greetingText,
    required this.homeIconPath,
    required this.accountIconPath,
    this.padding = const EdgeInsets.only(
        left: 8.0, top: 32, right: 8, bottom: 12), // Default padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: padding, // Use the passed padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Text
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    greetingText, // Use the passed greeting text
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      _buildCircleAvatar(homeIconPath), // Use home icon path
                      _buildCircleAvatar(
                          accountIconPath), // Use account icon path
                    ],
                  ),
                ],
              ),
            ),
            // Search Bar
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomSearchWithFilter(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build CircleAvatars for the icons
  Widget _buildCircleAvatar(String iconPath) {
    return CircleAvatar(
      foregroundColor: AppColors.whiteColor,
      backgroundColor: Colors.transparent,
      radius: 20.r,
      child: ImageIcon(
        size: 40.sp,
        AssetImage(iconPath), // Dynamically load the icon image
      ),
    );
  }
}
