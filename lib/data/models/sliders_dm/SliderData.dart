import 'package:ahdaf_task/domain/entities/Sliders/sliders_entity/slider_data_entity.dart';

import '../textDM.dart';

class SliderData extends SliderDataEntity {
  SliderData({
    super.id,
    super.title,
    super.subTitle,
    super.text,
    super.image,
    super.image2,
    super.status,
    super.createdAt,
    super.updatedAt,
  });

  factory SliderData.fromJson(Map<String, dynamic> json) => SliderData(
        id: json['id'] as int?,
        title: json['title'] == null
            ? null
            : TextDM.fromJson(json['title'] as Map<String, dynamic>),
        subTitle: json['sub_title'] == null
            ? null
            : TextDM.fromJson(json['sub_title'] as Map<String, dynamic>),
        text: json['text'] == null
            ? null
            : TextDM.fromJson(json['text'] as Map<String, dynamic>),
        image: json['image'] as String?,
        image2: json['image2'] as String?,
        status: json['status'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title?.toJson(),
        'sub_title': subTitle?.toJson(),
        'text': text?.toJson(),
        'image': image,
        'image2': image2,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
