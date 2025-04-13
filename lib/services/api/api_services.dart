import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl:
          "https://e56a-154-160-5-197.ngrok-free.app/api", // Update with your ngrok URL
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
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
      return {"error": e.response?.data["error"] ?? "Something went wrong"};
    } else {
      return {"error": "Network error. Please try again"};
    }
  }

  // ===========================================
  // ✅ **USER AUTHENTICATION**
  // ===========================================

  // 🔹 Register User
  Future<Map<String, dynamic>> registerUser(
      String name, String email, String password) async {
    try {
      Response response = await _dio.post("/auth/register", data: {
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
      Response response = await _dio.post("/auth/login", data: {
        "user_email": email,
        "password": password,
      });
      return response.data;
    } catch (e) {
      return _handleError(e as DioException);
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
