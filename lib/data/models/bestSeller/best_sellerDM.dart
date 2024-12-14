import 'package:ahdaf_task/domain/entities/bestSellers/best_seller_entity/best_seller_entity.dart';
import 'package:ahdaf_task/domain/entities/bestSellers/best_seller_entity/datum.dart';

class BestSellerDM extends BestSellerEntity {
  BestSellerDM({super.message, super.data});

  factory BestSellerDM.fromJson(Map<String, dynamic> json) {
    return BestSellerDM(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BestSellerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
