import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/components/constant/colour_scheme.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final String hintText;
  final Color textColor;
  final Color hintColor;
  final Color iconColor;

  const CustomSearchBar({
    Key? key,
    required this.controller,
    required this.onChanged,
    this.hintText = 'Search...',
    this.textColor = Colors.black,
    this.hintColor = Colors.grey,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool _isTyping = false;

  void _clearSearch() {
    widget.controller.clear();
    widget.onChanged('');
    setState(() {
      _isTyping = false;
    });
    FocusScope.of(context).unfocus(); // Remove focus from the text field
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: text_color2,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextField(
          controller: widget.controller,
          autofocus: false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: widget.hintColor),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                _isTyping ? Icons.close : Icons.search,
                color: widget.iconColor,
              ),
              onPressed: _isTyping ? _clearSearch : null,
            ),
          ),
          style: TextStyle(color: widget.textColor),
          onChanged: (query) {
            setState(() {
              _isTyping = query.isNotEmpty;
            });
            widget.onChanged(query);
          },
        ),
      ),
    );
  }
}
