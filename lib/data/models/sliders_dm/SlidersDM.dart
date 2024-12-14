import 'package:ahdaf_task/domain/entities/Sliders/sliders_entity/sliders_entity.dart';

import 'SliderData.dart';

class SlidersDM extends SlidersEntity {
  SlidersDM({super.message, super.data});

  factory SlidersDM.fromJson(Map<String, dynamic> json) => SlidersDM(
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => SliderData.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
