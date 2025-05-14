import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../../components/widgets/card1.dart';
import '../../provider/product_provider.dart';
import '../../provider/category_provider.dart';
import 'package:stylish_ecommerce_app/components/constant/text_styles.dart';
import '../../components/widgets/featured_product_widget/featured_section.dart';
import 'package:stylish_ecommerce_app/components/widgets/appbar_widget/appbar_widget.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  String? selectedCategoryId;
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
  }

  Future<void> _loadall() async {
    await Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  void _nextPage(Widget target) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => target),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final List<ProductModel> products = productProvider.products;
    final int? numbers = products.length;
    final bool isLoading = productProvider.isLoading;

    final Size screen = MediaQuery.of(context).size;
    final double height = screen.height;
    final double width = screen.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: CustomAppBar(
          height: 170,
          searchController: _searchController,
          onSearchChanged: (query) {
            setState(() {
              _searchQuery = query;
            });
          },
          onMapPressed: () {
            _loadall();
            // _nextPage(const Sketch());
          },
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                        child: Row(
                      children: [
                        Text('${numbers} Items in Wishlist'),
                        Container()
                      ],
                    )),
                    const SizedBox(height: 10),
                    products.isEmpty
                        ? SizedBox(
                            width: width,
                            height: height * 0.60,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Nothing in your Wishlist yet!',
                                    style: kheading3,
                                  )
                                ]),
                          )
                        : SizedBox(
                            width: width * 0.95,
                            height: height * 0.60092,
                            child: GridView.builder(
                              itemCount: products.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.67,
                              ),
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return ProductCard(
                                  imageUrl: product.imageUrl,
                                  productName: product.product_name,
                                  productDetails: product.product_details ?? '',
                                  price: product.product_price,
                                  rating: product.product_rating ?? 0,
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
      ),
    );
  }
}
