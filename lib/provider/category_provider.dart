import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../services/api/api_services.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];
  final ApiService apiService = ApiService();
  bool _isLoading = false;

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();

    try {
      _categories = await apiService.fetchCategories();
      print('Provider fetched categories: $_categories');
    } catch (e) {
      print('Provider Error fetching categories: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
