import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/components/constant/colour_scheme.dart';

import 'searchbar_widget.dart';

class CustomAppBar extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearchChanged;
  final Color backgroundColor;
  final VoidCallback onMapPressed;
  final VoidCallback onProfilePressed;

  const CustomAppBar({
    Key? key,
    required this.searchController,
    required this.onSearchChanged,
    required this.onMapPressed,
    required this.onProfilePressed,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return SizedBox(
      height: 200,
      width: screen.width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Map Button
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(28, 158, 158, 158),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: onMapPressed,
                    icon: const Icon(Icons.map_outlined),
                  ),
                ),

                // Logo
                Container(
                  width: 100,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logotxt.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Profile Icon
                Container(
                  decoration: BoxDecoration(
                    color: buton_color1, // Change to your button color
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person_3, size: 40),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Search Bar
            CustomSearchBar(
              controller: searchController,
              onChanged: onSearchChanged,
              hintText: 'Search Products',
              textColor: Colors.black, // Customize
              hintColor: Colors.grey, // Customize
              iconColor: Colors.grey, // Customize
            ),
          ],
        ),
      ),
    );
  }
}
