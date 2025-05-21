import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../../models/product_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl:
          "https://j85nv7qj-5000.uks1.devtunnels.ms/api", // Update with your ngrok URL
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  // 🔹 **Set Auth Token for Requests**
  void setAuthToken(String token) {
    _dio.options.headers["Authorization"] = "Bearer $token";
  }

  // 🔹 **Handle API Errors**
  dynamic _handleError(DioException e) {
    if (e.response != null) {
      final data = e.response?.data;

      print("API Error Response: ${data}");

      // Check if it's a Map (so we can safely access by key)
      if (data is Map<String, dynamic>) {
        return {"error": data["error"] ?? "Something went wrong"};
      } else {
        return {"error": "Unexpected response format"};
      }
    } else {
      return {"error": "Network error. Please try again"};
    }
  }

  // dynamic _handleError(DioException e) {
  //   if (e.response != null) {
  //     return {"error": e.response?.data["error"] ?? "Something went wrong"};
  //   } else {
  //     return {"error": "Network error. Please try again"};
  //   }
  // }

  // ===========================================
  // ✅ **USER AUTHENTICATION**
  // ===========================================

  // 🔹 Register User
  Future<Map<String, dynamic>> registerUser(
      String name, String email, String password) async {
    try {
      Response response = await _dio.post("/register", data: {
        "user_name": name,
        "user_email": email,
        "password": password,
      });
      return response.data;
    } catch (e) {
      return _handleError(e as DioException);
    }
  }

  // 🔹 Login User
  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      Response response = await _dio.post("/login", data: {
        "user_email": email,
        "password": password,
      });
      return response.data;
    } catch (e) {
      return _handleError(e as DioException);
    }
  }

  // ===========================================
  // ✅ **CATEGORIES API**
  // ===========================================
  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await _dio.get('/categories');
      final List data = response.data;
      return data.map((item) => CategoryModel.fromMap(item)).toList();
    } catch (e) {
      debugPrint('API Error fetching categories: $e');
      throw Exception('Failed to load categories');
    }
  }

  Future<List<ProductModel>> fetchProductsByCategory(String category_id) async {
    try {
      final response = await _dio.get('/products', queryParameters: {
        'category': category_id,
      });

      final List data = response.data;
      return data.map((item) => ProductModel.fromMap(item)).toList();
    } catch (e) {
      debugPrint('API Error fetching products by category: $e');
      throw Exception('Failed to load products by category');
    }
  }

  // ===========================================
  // ✅ **PRODUCTS API**
  // ===========================================

  // 🔹 Get All Products
  Future<List<dynamic>> getProducts() async {
    try {
      Response response = await _dio.get("/products");
      return response.data;
    } catch (e) {
      return [];
    }
  }

  // 🔹 Get Single Product by ID
  Future<Map<String, dynamic>?> getProductById(String productId) async {
    try {
      Response response = await _dio.get("/products/$productId");
      return response.data;
    } catch (e) {
      return null;
    }
  }

  // 🔹 Get Multiple Products by IDs
  Future<List<ProductModel>> fetchProductsByIds(List<String> ids) async {
    final response = await _dio.get('/products', queryParameters: {
      'ids': ids.join(','),
    });
    return (response.data as List).map((m) => ProductModel.fromMap(m)).toList();
  }

  // 🔹 Create a Product (Admin Only)
  Future<Map<String, dynamic>> createProduct(
    String name,
    String details,
    String type,
    double price,
    String imageUrl,
  ) async {
    try {
      Response response = await _dio.post("/products", data: {
        "product_name": name,
        "product_details": details,
        "product_type": type,
        "product_price": price,
        "image_url": imageUrl,
      });
      return response.data;
    } catch (e) {
      return _handleError(e as DioException);
    }
  }

  // ===========================================
  // ✅ **ORDERS API**
  // ===========================================

  // 🔹 Create Order
  Future<Map<String, dynamic>> createOrder(String productId, int quantity,
      String address, double latitude, double longitude) async {
    try {
      Response response = await _dio.post("/orders", data: {
        "product_id": productId,
        "quantity": quantity,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
      });
      return response.data;
    } catch (e) {
      return _handleError(e as DioException);
    }
  }

  // 🔹 Get All Orders
  Future<List<dynamic>> getOrders() async {
    try {
      Response response = await _dio.get("/orders");
      return response.data;
    } catch (e) {
      return [];
    }
  }

  // 🔹 Get Order by ID
  Future<Map<String, dynamic>?> getOrderById(String orderId) async {
    try {
      Response response = await _dio.get("/orders/$orderId");
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
