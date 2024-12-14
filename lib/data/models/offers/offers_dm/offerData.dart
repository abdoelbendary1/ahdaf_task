import 'package:ahdaf_task/domain/entities/product.dart';

import '../../product.dart';

class OffersData {
  String? name;
  ProductEntity? product;

  OffersData({this.name, this.product});

  factory OffersData.fromJson(Map<String, dynamic> json) => OffersData(
        name: json['name'] as String?,
        product: json['product'] == null
            ? null
            : ProductDM.fromJson(json['product'] as Map<String, dynamic>),
      );
}
