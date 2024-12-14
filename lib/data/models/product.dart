import 'package:ahdaf_task/domain/entities/product.dart';

class ProductDM extends ProductEntity {
  ProductDM({
    super.id,
    super.name,
    super.price,
    super.sale,
    super.discountOffer,
    super.description,
    super.image,
    super.category,
    super.brand,
    super.offer,
    super.label,
    super.stock,
    super.sku,
    super.collection,
    super.rating,
  });

  factory ProductDM.fromJson(Map<String, dynamic> json) => ProductDM(
        id: json['id'] as int?,
        name: json['name'] as String?,
        price: json['price'] as int?,
        sale: json['sale'] as int?,
        discountOffer: json['discount_offer'] as int?,
        description: json['description'] as String?,
        image: json['image'] as String?,
        category: json['category'] as String?,
        brand: json['brand'] as String?,
        offer: json['offer'] as String?,
        label: json['label'] as String?,
        stock: json['stock'] as String?,
        sku: json['sku'] as String?,
        collection: json['collection'] as String?,
        rating: json['rating'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'sale': sale,
        'discount_offer': discountOffer,
        'description': description,
        'image': image,
        'category': category,
        'brand': brand,
        'offer': offer,
        'label': label,
        'stock': stock,
        'sku': sku,
        'collection': collection,
        'rating': rating,
      };
}
