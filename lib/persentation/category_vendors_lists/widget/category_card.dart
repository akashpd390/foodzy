import 'package:flutter/material.dart';
import 'package:foodzy/domain/category_vendors_list/models/category_model.dart';

/////
///
///
///
///
///
///       ///// Category Cards Widget that uses to show the categories in the home page
///
///
/// ///
class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.network(
                category.mediaurls?.images?.first.default_ ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(Icons.broken_image,
                        size: 40, color: Colors.grey[400]),
                  );
                },
              ),
            ),

            Positioned(
              top: 8,
              left: 8,
              child: Text(
                category.title ?? "no title",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
