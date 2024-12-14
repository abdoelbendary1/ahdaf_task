import 'CategoryData.dart';

class CategoryEntity {
  String? message;
  List<CategoryData>? data;

  CategoryEntity({this.message, this.data});

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return CategoryEntity(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
