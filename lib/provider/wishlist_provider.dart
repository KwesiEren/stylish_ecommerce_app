import '../models/product_model.dart';
import 'package:flutter/material.dart';
import '../services/api/api_services.dart';
import '../services/data/wishlist_dao.dart';

class WishlistProvider with ChangeNotifier {
  final WishlistDao _dao;
  final ApiService _apiService;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;
  bool get hasError => _error != null;

  List<ProductModel> _items = [];
  List<ProductModel> get items => _items;

  WishlistProvider(this._dao, {ApiService? apiService}) 
    : _apiService = apiService ?? ApiService();

  Future<void> loadWishlist() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final ids = await _dao.getWishlistIds();
      
      if (ids.isEmpty) {
        _items = [];
      } else {
        // Fetch full product details from API
        _items = await _apiService.fetchProductsByIds(ids);
        
        // Sort by most recently added
        _items.sort((a, b) {
          final aTime = _dao.getAddedTime(a.product_id);
          final bTime = _dao.getAddedTime(b.product_id);
          return bTime.compareTo(aTime); // Newest first
        });
      }
    } catch (e) {
      _error = 'Failed to load wishlist: ${e.toString()}';
      debugPrint('WishlistProvider error: $_error');
      _items = []; // Reset to empty on error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  bool isInWishList(String id) {
    return _items.any((product) => product.product_id == id);
  }

  Future<bool> toggleWishlistItem(String productId) async {
    try {
      if (isInWishList(productId)) {
        await remove(productId);
        return false;
      } else {
        await add(productId);
        return true;
      }
    } catch (e) {
      _error = 'Failed to toggle wishlist: ${e.toString()}';
      debugPrint('WishlistProvider error: $_error');
      rethrow;
    }
  }

  Future<void> add(String productId) async {
    try {
      final success = await _dao.addToWishlist(productId);
      if (!success) throw Exception('Failed to add to wishlist');
      
      // Optimistically update UI
      if (!isInWishList(productId)) {
        final product = await _apiService.getProductById(productId);
        _items.insert(0, product); // Add to beginning
        notifyListeners();
      }
      
      // Refresh to ensure consistency
      await loadWishlist();
    } catch (e) {
      _error = 'Failed to add to wishlist: ${e.toString()}';
      debugPrint('WishlistProvider error: $_error');
      rethrow;
    }
  }

  Future<void> remove(String productId) async {
    try {
      final success = await _dao.removeFromWishlist(productId);
      if (!success) throw Exception('Failed to remove from wishlist');
      
      // Optimistically update UI
      _items.removeWhere((p) => p.product_id == productId);
      notifyListeners();
      
      // Refresh to ensure consistency
      await loadWishlist();
    } catch (e) {
      _error = 'Failed to remove from wishlist: ${e.toString()}';
      debugPrint('WishlistProvider error: $_error');
      rethrow;
    }
  }

  Future<void> clear() async {
    try {
      await _dao.clearWishlist();
      _items = [];
      notifyListeners();
    } catch (e) {
      _error = 'Failed to clear wishlist: ${e.toString()}';
      debugPrint('WishlistProvider error: $_error');
      rethrow;
    }
  }

  Future<int> get itemCount async {
    try {
      return await _dao.getWishlistCount();
    } catch (e) {
      debugPrint('Failed to get wishlist count: $e');
      return _items.length; // Fallback to local count
    }
  }
}