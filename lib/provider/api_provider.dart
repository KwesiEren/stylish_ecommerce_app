import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/order_model.dart';
import '../models/product_model.dart';
import '../services/api/api_services.dart';
import '../services/data/order_dao.dart';

class ApiProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  final OrdersDao orderDao;

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  ApiProvider({
    required this.orderDao,
  });

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  /// Load user session on app start
  Future<void> _loadSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("auth_token");
    if (token != null) {
      _apiService.setAuthToken(token);
      _isAuthenticated = true;
      notifyListeners();
    }
  }

  /// Login user and store token
  Future<Map<String, dynamic>> login(String email, String password) async {
    final result = await _apiService.loginUser(email, password);
    debugPrint('Login: $result');
    if (result.containsKey("token")) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", result["token"]);
      _apiService.setAuthToken(result["token"]);
      _isAuthenticated = true;
      notifyListeners();
    }
    return result;
  }

  /// Register user
  Future<Map<String, dynamic>> register(
      String name, String email, String password) async {
    return await _apiService.registerUser(name, email, password);
  }

  /// Logout and clear session
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("auth_token");
    _isAuthenticated = false;
    notifyListeners();
  }

  // Fetch products from API and cache locally
  Future<void> fetchProducts() async {
    final data = await _apiService.getProducts();
    _products = data.map((item) => ProductModel.fromMap(item)).toList();
    notifyListeners();
  }

  // 🔹 Create Order & Save Locally (Only if API call succeeds)
  Future<bool> createOrder({
    required String productId,
    required int quantity,
    required String address,
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _apiService.createOrder(
        productId,
        quantity,
        address,
        latitude,
        longitude,
      );

      if (response.containsKey("order_id")) {
        // Create OrderModel from response
        final order = OrderModel.fromMap(response);
        await orderDao.insertOrder(order);
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
