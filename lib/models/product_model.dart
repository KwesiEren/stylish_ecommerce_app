import 'category_model.dart';

class ProductModel {
  // Declaring Product Parameters
  final String product_id;
  final String imageUrl;
  final String product_name;
  final String? product_details;
  final String? product_description;
  final CategoryModel category;
  final double product_price;
  final double? product_rating;
  final DateTime createdAt;

  ProductModel({
    required this.product_id,
    required this.imageUrl,
    required this.product_name,
    this.product_details,
    this.product_description,
    this.product_rating,
    required this.product_price,
    required this.createdAt,
    required this.category,
  });

  /// Methods For Changing State of data ///

  // fromMap function (When recieving data from API)
  static ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel(
      product_id: map["product_id"],
      imageUrl: map["image_url"],
      product_name: map["product_name"],
      product_details: map["product_details"],
      product_description: map["product_description"],
      product_rating: map["product_rating"] != null
          ? double.tryParse(map["product_rating"].toString())
          : null,
      product_price: double.tryParse(map["product_price"].toString()) ?? 0.0,
      createdAt: DateTime.parse(map["createdAt"]),
      category: CategoryModel.fromMap(map["category"]),
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      "product_id": product_id,
      "image_url": imageUrl,
      "product_name": product_name,
      "product_details": product_details,
      "product_description": product_description,
      "category": category.toMap(),
      "product_price": product_price,
      "product_rating": product_rating,
      "createdAt": createdAt.toIso8601String(),
    };
  }
}
