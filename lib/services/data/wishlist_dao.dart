import 'package:sqflite/sqflite.dart';

class WishlistDao {
  final Database db;
  WishlistDao(this.db);

  Future<void> addToWishlist(String productId) =>
      db.insert('wishlists', {'product_id': productId},
          conflictAlgorithm: ConflictAlgorithm.ignore);

  Future<void> removeFromWishlist(String productId) =>
      db.delete('wishlists', where: 'product_id = ?', whereArgs: [productId]);

  Future<List<String>> getWishlistIds() async {
    final rows = await db.query('wishlists', columns: ['product_id']);
    return rows.map((r) => r['product_id'] as String).toList();
  }
}
