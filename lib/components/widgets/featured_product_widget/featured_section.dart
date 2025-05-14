import 'package:flutter/material.dart';

import '../../../models/category_model.dart';
import 'circlecard_widget2.dart';

class FeatureSection extends StatelessWidget {
  final List<CategoryModel> categories;
  final Function(String categoryId) onCategorySelected;

  const FeatureSection({
    Key? key,
    required this.categories,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.all(5),
            child: CircleCard2(
                imgUrl: category.imageUrl!,
                text: category.name,
                onPressed: () => onCategorySelected(category.category_id)),
          );
        },
      ),
    );
  }
}
