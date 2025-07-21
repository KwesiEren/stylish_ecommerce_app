import '../models/product_model.dart';
import 'package:flutter/material.dart';
import '../services/api/api_services.dart';
import '../services/data/wishlist_dao.dart';

class WishlistProvider with ChangeNotifier {
  final WishlistDao _dao;
  final ApiService _api = ApiService();

  List<ProductModel> _items = [];
  List<ProductModel> get items => _items;

  WishlistProvider(
    this._dao,
  );

  Future<void> loadWishlist() async {
    // 1. load IDs locally
    final ids = await _dao.getWishlistIds();
    if (ids.isEmpty) {
      _items = [];
    } else {
      // 2. fetch full products from API
      _items = await _api.fetchProductsByIds(ids);
    }
    notifyListeners();
  }

  Future<void> add(String id) async {
    await _dao.addToWishlist(id);
    await loadWishlist();
  }

  Future<void> remove(String id) async {
    await _dao.removeFromWishlist(id);
    await loadWishlist();
  }
}
