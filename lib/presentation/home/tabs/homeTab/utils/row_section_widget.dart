import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ahdaf_task/core/theme/app_colors.dart';

class RowSectionWidget extends StatelessWidget {
  final String name;

  RowSectionWidget({
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.darkPrimaryColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
        Container(
          decoration:
              const BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'عرض الكل',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.darkPrimaryColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
