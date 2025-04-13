import 'package:sqflite/sqflite.dart';
import '../../models/product_model.dart';

class ProductDao {
  final Database db;

  ProductDao(this.db);

  Future<void> insertProduct(ProductModel product) async {
    await db.insert(
      'products',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ProductModel>> getAllProducts() async {
    final List<Map<String, dynamic>> maps = await db.query('products');
    return maps.map((map) => ProductModel.fromMap(map)).toList();
  }

  Future<ProductModel?> getProductById(String id) async {
    final List<Map<String, dynamic>> maps =
        await db.query('products', where: 'product_id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) return ProductModel.fromMap(maps.first);
    return null;
  }

  Future<int> deleteProduct(String id) async {
    return await db
        .delete('products', where: 'product_id = ?', whereArgs: [id]);
  }
}
