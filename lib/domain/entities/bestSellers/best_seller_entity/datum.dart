import 'package:ahdaf_task/data/models/product.dart';
import 'package:ahdaf_task/domain/entities/product.dart';

class BestSellerData {
  int? id;
  int? salesCount;
  String? lastSoldAt;
  ProductEntity? product;

  BestSellerData({this.id, this.salesCount, this.lastSoldAt, this.product});

  factory BestSellerData.fromJson(Map<String, dynamic> json) => BestSellerData(
        id: json['id'] as int?,
        salesCount: json['sales_count'] as int?,
        lastSoldAt: json['last_sold_at'] as String?,
        product: json['product'] == null
            ? null
            : ProductDM.fromJson(json['product'] as Map<String, dynamic>),
      );
}
