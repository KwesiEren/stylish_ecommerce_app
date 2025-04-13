import 'package:sqflite/sqflite.dart';

import '../../models/order_model.dart';

class OrdersDao {
  final Database db;

  OrdersDao(this.db);

  Future<void> insertOrder(OrderModel order) async {
    await db.insert(
      'orders',
      order.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<OrderModel>> getAllOrders() async {
    final List<Map<String, dynamic>> maps = await db.query('orders');
    return maps.map((map) => OrderModel.fromMap(map)).toList();
  }

  Future<OrderModel?> getOrderById(String id) async {
    final List<Map<String, dynamic>> maps =
        await db.query('orders', where: 'order_id = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return OrderModel.fromMap(maps.first);
    }
    return null;
  }

  Future<void> deleteOrder(String id) async {
    await db.delete('orders', where: 'order_id = ?', whereArgs: [id]);
  }

  Future<void> updateOrder(OrderModel order) async {
    await db.update(
      'orders',
      order.toMap(),
      where: 'order_id = ?',
      whereArgs: [order.orderId],
    );
  }
}
