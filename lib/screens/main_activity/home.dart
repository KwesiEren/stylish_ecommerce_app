import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../../components/widgets/card1.dart';
import '../../provider/product_provider.dart';
import '../../provider/category_provider.dart';
import '../../components/widgets/featured_product_widget/featured_section.dart';
import 'package:stylish_ecommerce_app/components/widgets/appbar_widget/appbar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCategoryId;
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> productz = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<CategoryProvider>(context, listen: false).fetchCategories();
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
  }

  Future<void> _loadall() async {
    Provider.of<CategoryProvider>(context, listen: false).fetchCategories();
    await Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  void _onCategorySelected(String categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
    });
    Provider.of<ProductProvider>(context, listen: false)
        .fetchProductsByCategory(selectedCategoryId!);
  }

  void _nextPage(Widget target) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => target),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final List<ProductModel> products = productProvider.products;
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
                    if (categoryProvider.isLoading)
                      CircularProgressIndicator()
                    else
                      FeatureSection(
                        categories: categoryProvider.categories,
                        onCategorySelected: _onCategorySelected,
                      ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: width * 0.99,
                      height: height * 0.47636,
                      child: Center(
                        child: GridView.builder(
                          itemCount: products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 0,
                            childAspectRatio: 0.7,
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
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
