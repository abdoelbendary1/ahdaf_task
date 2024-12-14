import 'package:ahdaf_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BuildLoadingUI extends StatelessWidget {
  const BuildLoadingUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 36.h),
        Align(
          alignment: Alignment.center,
          child: Center(child: LoadingStateAnimation()),
        ),
        SizedBox(height: 36.h),
      ],
    );
  }
}

class LoadingStateAnimation extends StatelessWidget {
  LoadingStateAnimation({super.key, this.leftDotColor, this.rightDotColor});
  Color? leftDotColor;
  Color? rightDotColor;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.flickr(
            leftDotColor: leftDotColor ?? Colors.orange,
            rightDotColor: rightDotColor ?? AppColors.greyColor,
            size: 60));
  }
}
