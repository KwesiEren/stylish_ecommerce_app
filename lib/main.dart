import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish_ecommerce_app/screens/skeleton.dart';
import 'package:stylish_ecommerce_app/provider/api_provider.dart';
import 'package:stylish_ecommerce_app/services/data/store_db.dart';
import 'package:stylish_ecommerce_app/provider/order_provider.dart';
import 'package:stylish_ecommerce_app/services/data/order_dao.dart';
import 'package:stylish_ecommerce_app/provider/product_provider.dart';
import 'package:stylish_ecommerce_app/services/data/product_dao.dart';
import 'package:stylish_ecommerce_app/provider/category_provider.dart';
import 'package:stylish_ecommerce_app/provider/wishlist_provider.dart';
import 'package:stylish_ecommerce_app/services/data/wishlist_dao.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize database
    final dbHelper = DBHelper();
    final database = await dbHelper.database;

    // Initialize all DAOs
    final productDao = ProductDao(database);
    final wishlistDao = WishlistDao(dbHelper);  // Updated to use DBHelper
    final orderDao = OrdersDao(database);

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ApiProvider(orderDao: orderDao),
          ),
          ChangeNotifierProvider(
            create: (_) => ProductProvider(productDao),
          ),
          ChangeNotifierProvider(
            create: (_) => CategoryProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => WishlistProvider(wishlistDao)
              ..loadWishlist(),  // Preload wishlist data
          ),
          ChangeNotifierProvider(
            create: (_) => OrderProvider(orderDao),
          ),
        ],
        child: const MyApp(),
      ),
    );
  } catch (e) {
    // Fallback UI if initialization fails
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Failed to initialize app: ${e.toString()}'),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stylish E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainScreen(),
    );
  }
}