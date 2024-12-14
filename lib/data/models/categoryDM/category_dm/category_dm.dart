import 'package:ahdaf_task/domain/entities/categoryEntity/category_entity/CategoryData.dart';
import 'package:ahdaf_task/domain/entities/categoryEntity/category_entity/category_entity.dart';

class CategoryDM extends CategoryEntity {
  CategoryDM({super.message, super.data});

  factory CategoryDM.fromJson(Map<String, dynamic> json) => CategoryDM(
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
