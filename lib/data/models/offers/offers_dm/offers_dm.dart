import 'package:ahdaf_task/domain/entities/offers/offers_entity/offers_entity.dart';

import 'offerData.dart';

class OffersDM extends OffersEntity {
  OffersDM({super.message, super.data});

  factory OffersDM.fromJson(Map<String, dynamic> json) => OffersDM(
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => OffersData.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
