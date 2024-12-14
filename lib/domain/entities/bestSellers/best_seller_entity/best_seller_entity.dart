import 'datum.dart';

class BestSellerEntity {
  String? message;
  List<BestSellerData>? data;

  BestSellerEntity({this.message, this.data});

  factory BestSellerEntity.fromJson(Map<String, dynamic> json) {
    return BestSellerEntity(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BestSellerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
