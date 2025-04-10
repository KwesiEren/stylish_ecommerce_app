import 'package:flutter/material.dart';

import '../constant/colour_scheme.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final double height = screen.height;
    final double width = screen.width;

    Color buttonColor1 = isClicked ? buton_color2 : base_color;
    Color buttonColor2 = isClicked ? base_color : text_color1;
    double iconSize = isClicked ? 30 : 25;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BottomAppBar(
          shape: CircularNotchedRectangle(inverted: true),
          notchMargin: 10,
          elevation: 10,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTabItem(Icons.home_outlined, "Home", 0),
                _buildTabItem(Icons.favorite_border, "Wishlist", 1),
                SizedBox(
                  width: 40,
                ), // space for the floating button
                _buildTabItem(Icons.search, "Search", 2),
                _buildTabItem(Icons.settings, "Setting", 3),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 23,
          child: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: buttonColor1,
            elevation: 1,
            onPressed: () {
              setState(() {
                isClicked = !isClicked;
              });
              widget.onItemTapped(4); // Cart tapped
            },
            child: Icon(
              Icons.shopping_cart_outlined,
              color: buttonColor2,
              size: iconSize,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabItem(IconData icon, String label, int index) {
    final bool isSelected = widget.selectedIndex == index;
    return InkWell(
      onTap: () => widget.onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.black),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
