// lib/providers/product_provider.dart
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/api/api_services.dart';
import '../services/data/product_dao.dart';

class ProductProvider extends ChangeNotifier {
  final ProductDao productDao;
  final ApiService apiService = ApiService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

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

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<dynamic> response = await apiService.getProducts();
      _products = response.map((json) => ProductModel.fromMap(json)).toList();
    } catch (e) {
      // Log or handle error
      print("Error loading products: $e");
      _products = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  void clearProducts() {
    _products = [];
    notifyListeners();
  }
}
