import 'package:ahdaf_task/core/constants/my_assets.dart';
import 'package:ahdaf_task/core/theme/app_colors.dart';
import 'package:ahdaf_task/presentation/home/tabs/homeTab/utils/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchWithFilter extends StatelessWidget {
  const CustomSearchWithFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(),
        ),
        
      ],
    );
  }
}
