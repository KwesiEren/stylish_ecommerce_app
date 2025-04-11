class ProductModel {
  // Declaring Product Parameters
  final String product_id;
  final String imageUrl;
  final String product_name;
  final String? product_details;
  final String? product_description;
  final String product_type;
  final double product_price;
  final double? product_rating;
  final DateTime createdAt;

  ProductModel(
      {required this.product_id,
      required this.imageUrl,
      required this.product_name,
      this.product_details,
      this.product_description,
      required this.product_type,
      this.product_rating,
      required this.product_price,
      required this.createdAt});

  /// Methods For Changing State of data ///

  // fromMap function (When recieving data from API)
  static ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel(
      product_id: map["product_id"],
      imageUrl: map["image_url"],
      product_name: map["product_name"],
      product_details: map["product_details"],
      product_description: map["product_description"],
      product_type: map["product_type"],
      product_rating: map["product_rating"],
      product_price: map["product_price"],
      createdAt: DateTime.parse(map["createdAt"]),
    );
  }
}
