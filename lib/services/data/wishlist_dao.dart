import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';
import 'store_db.dart'; // Assuming DBHelper is here

class WishlistDao {
  static const String _tableName = 'wishlists';
  static const String _columnId = 'id';
  static const String _columnProductId = 'product_id';
  static const String _columnAddedAt = 'added_at';

  final DBHelper _dbHelper;

  WishlistDao(this._dbHelper);

  Future<Database> get _database async => await _dbHelper.database;

  /// Adds a product to wishlist or ignores if already exists
  Future<bool> addToWishlist(String productId) async {
    final db = await _database;
    try {
      final insertedId = await db.insert(
        _tableName,
        {
          _columnProductId: productId,
          // added_at will automatically use CURRENT_TIMESTAMP
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
      return insertedId != 0;
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        debugPrint('WishlistDao Error (add): ${e.toString()}');
      }
      return false;
    }
  }

  /// Removes a product from wishlist
  Future<bool> removeFromWishlist(String productId) async {
    final db = await _database;
    try {
      final count = await db.delete(
        _tableName,
        where: '$_columnProductId = ?',
        whereArgs: [productId],
      );
      return count > 0;
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        debugPrint('WishlistDao Error (remove): ${e.toString()}');
      }
      return false;
    }
  }

  /// Gets all wishlisted product IDs in reverse chronological order
  Future<List<String>> getWishlistIds() async {
    final db = await _database;
    try {
      final rows = await db.query(
        _tableName,
        columns: [_columnProductId],
        orderBy: '$_columnAddedAt DESC', // Newest first
      );
      return rows.map((r) => r[_columnProductId] as String).toList();
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        debugPrint('WishlistDao Error (getAll): ${e.toString()}');
      }
      return [];
    }
  }

  /// Checks if a product exists in wishlist
  Future<bool> isInWishlist(String productId) async {
    final db = await _database;
    try {
      final rows = await db.query(
        _tableName,
        columns: [_columnProductId],
        where: '$_columnProductId = ?',
        whereArgs: [productId],
        limit: 1,
      );
      return rows.isNotEmpty;
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        debugPrint('WishlistDao Error (check): ${e.toString()}');
      }
      return false;
    }
  }

  /// Clears all items from wishlist
  Future<int> clearWishlist() async {
    final db = await _database;
    try {
      return await db.delete(_tableName);
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        debugPrint('WishlistDao Error (clear): ${e.toString()}');
      }
      return 0;
    }
  }

  /// Gets total count of wishlist items
  Future<int> getWishlistCount() async {
    final db = await _database;
    try {
      final result = await db.rawQuery('SELECT COUNT(*) FROM $_tableName');
      return Sqflite.firstIntValue(result) ?? 0;
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        debugPrint('WishlistDao Error (count): ${e.toString()}');
      }
      return 0;
    }
  }

  /// Gets the timestamp when an item was added
  Future<DateTime?> getAddedTime(String productId) async {
    final db = await _database;
    try {
      final rows = await db.query(
        _tableName,
        columns: [_columnAddedAt],
        where: '$_columnProductId = ?',
        whereArgs: [productId],
      );
      if (rows.isNotEmpty) {
        return DateTime.parse(rows.first[_columnAddedAt] as String);
      }
      return null;
    } on DatabaseException catch (e) {
      if (kDebugMode) {
        debugPrint('WishlistDao Error (getTime): ${e.toString()}');
      }
      return null;
    }
  }
}
