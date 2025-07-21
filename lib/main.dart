import 'provider/api_provider.dart';
import 'services/data/store_db.dart';
import 'provider/order_provider.dart';
import 'services/data/order_dao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/product_provider.dart';
import 'services/data/product_dao.dart';
import 'package:stylish_ecommerce_app/screens/main_activity/home.dart';
import 'package:stylish_ecommerce_app/services/data/wishlist_dao.dart';
import 'package:stylish_ecommerce_app/provider/wishlist_provider.dart';
import 'package:stylish_ecommerce_app/provider/category_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dbHelper = DBHelper();

  final database = await dbHelper.database;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ApiProvider(orderDao: OrdersDao(database))),
        ChangeNotifierProvider(
            create: (_) => ProductProvider(ProductDao(database))),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(
            create: (_) => WishlistProvider(WishlistDao(database))),
        ChangeNotifierProvider(
            create: (_) => OrderProvider(
                  OrdersDao(database),
                )),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
