import 'package:ahdaf_task/data/models/textDM.dart';
import 'package:ahdaf_task/domain/entities/textEntity.dart';

class CategoryData {
  int? id;
  TextEntity? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoryData(
      {this.id, this.name, this.image, this.createdAt, this.updatedAt});

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json['id'] as int?,
        name: json['name'] == null
            ? null
            : TextDM.fromJson(json['name'] as Map<String, dynamic>),
        image: json['image'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name?.toJson(),
        'image': image,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
