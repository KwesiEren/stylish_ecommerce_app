// lib/providers/order_provider.dart
import 'package:flutter/material.dart';
import '../models/order_model.dart';
import '../services/data/order_dao.dart';

class OrderProvider extends ChangeNotifier {
  final OrdersDao orderDao;

  List<OrderModel> _orders = [];
  List<OrderModel> get orders => _orders;

  OrderProvider(this.orderDao);

  Future<void> loadOrders() async {
    _orders = await orderDao.getAllOrders();
    notifyListeners();
  }

  Future<void> addOrder(OrderModel order) async {
    await orderDao.insertOrder(order);
    await loadOrders();
  }

  Future<void> deleteOrder(String orderId) async {
    await orderDao.deleteOrder(orderId);
    await loadOrders();
  }
}
