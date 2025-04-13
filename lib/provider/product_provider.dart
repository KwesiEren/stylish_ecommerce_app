// lib/providers/product_provider.dart
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/data/product_dao.dart';

class ProductProvider extends ChangeNotifier {
  final ProductDao productDao;

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  ProductProvider(this.productDao);

  Future<void> loadProducts() async {
    _products = await productDao.getAllProducts();
    notifyListeners();
  }

  Future<void> addProduct(ProductModel product) async {
    await productDao.insertProduct(product);
    await loadProducts();
  }

  Future<void> deleteProduct(String productId) async {
    await productDao.deleteProduct(productId);
    await loadProducts();
  }
}
