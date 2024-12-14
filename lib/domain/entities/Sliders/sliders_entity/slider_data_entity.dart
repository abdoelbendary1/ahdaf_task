import '../../textEntity.dart';

class SliderDataEntity {
  int? id;
  TextEntity? title;
  TextEntity? subTitle;
  TextEntity? text;
  String? image;
  String? image2;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  SliderDataEntity({
    this.id,
    this.title,
    this.subTitle,
    this.text,
    this.image,
    this.image2,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
}
