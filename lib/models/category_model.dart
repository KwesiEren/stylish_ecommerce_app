class CategoryModel {
  final String category_id;
  final String name;
  final String? imageUrl;

  CategoryModel({
    required this.category_id,
    required this.name,
    this.imageUrl,
  });

  static CategoryModel fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      category_id: map['category_id'],
      name: map['name'],
      imageUrl: map['image_url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "category_id": category_id,
      "name": name,
      "image_url": imageUrl,
    };
  }
}
