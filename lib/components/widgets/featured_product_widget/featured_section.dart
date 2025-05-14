import 'circlecard_widget2.dart';
import 'package:flutter/material.dart';
import '../../../models/category_model.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Featured',
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'Monserrat',
              fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          height: 97,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Padding(
                padding: const EdgeInsets.all(5),
                child: CircleCard2(
                    borderclr: Colors.transparent,
                    imgUrl: category.imageUrl!,
                    text: category.name,
                    onPressed: () => onCategorySelected(category.category_id)),
              );
            },
          ),
        ),
      ],
    );
  }
}
