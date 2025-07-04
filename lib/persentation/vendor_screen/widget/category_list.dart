import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodzy/domain/vendors_screen/model/cart_item.dart';
import 'package:foodzy/domain/vendors_screen/model/menu_category_model.dart';
import 'package:foodzy/domain/vendors_screen/model/menu_itme.dart';
import 'package:foodzy/persentation/vendor_screen/bloc/cart_cubit.dart';

/// M
///
///
//////      CategoryList widget that displays a list of menu items under each category.
class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.category,
  });

  final MenuCategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent, // Remove internal dividers
        splashColor: Colors.transparent, // Remove tap splash
        highlightColor: Colors.transparent,
        expansionTileTheme: const ExpansionTileThemeData(
          shape: Border(), // No shape border when expanded
          collapsedShape: Border(), // No shape border when collapsed
          backgroundColor: Colors.transparent,
          collapsedBackgroundColor: Colors.transparent,
        ),
      ),
      child: ExpansionTile(
        title: SizedBox(
          width: double.infinity,
          height: 50,
          child: Text(
            category.categoryName ?? 'Category',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        children: category.items?.map((item) {
              return menuTile(item, context);
            }).toList() ??
            [],
      ),
    );
  }

//
////
  ///
  ///
  ///         MenuTile widget that displays each menu item with its image, name, price, and add/remove buttons.
  Widget menuTile(MenuItemModel item, BuildContext context) {
    final cartCubit = context.watch<CartCubit>();
    final quantity = cartCubit.getItemQuantity(item.id ?? 0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Menu item image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    item.mediaurls?.images?.first.default_ ?? '',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    // Placeholder for image loading errors
                    errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) =>
                        Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[300],
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Item details (name, price, customize)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.title ?? 'Menu Item',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${item.price?.toStringAsFixed(0)}', // Display price without decimals
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ),

                // Add button or Quantity selector
                Align(
                  alignment: Alignment.centerRight,
                  child: quantity == 0
                      ? SizedBox(
                          width: 80,
                          height: 35,
                          child: OutlinedButton(
                            onPressed: () {
                              cartCubit.addItem(CartItem(
                                  id: item.id ?? 0,
                                  name: item.title ?? "no title",
                                  price: item.price ?? 0,
                                  quantity: quantity + 1));
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.green[700]!),
                              foregroundColor: Colors.green[700],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            child: const Text('Add',
                                style: TextStyle(fontSize: 14)),
                          ),
                        )
                      : Container(
                          width: 100, // Fixed width for quantity controls
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.remove,
                                    color: Colors.white, size: 20),
                                onPressed: () {
                                  cartCubit.decreaseQuantity(item.id ?? 0);
                                },
                                visualDensity: VisualDensity.compact,
                                padding: EdgeInsets.zero,
                              ),
                              Text(
                                quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add,
                                    color: Colors.white, size: 20),
                                onPressed: () {
                                  cartCubit.addItem(
                                    CartItem(
                                      id: item.id ?? 0,
                                      name: item.title ?? "no title",
                                      price: item.price ?? 0,
                                      quantity: quantity + 1,
                                    ),
                                  );
                                },
                                visualDensity: VisualDensity.compact,
                                padding: EdgeInsets.zero,
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
            // Subtle divider below each menu item
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Divider(
                  height: 1,
                  color: Colors.black12,
                  indent: 92), // Indent to align with text
            ),
          ],
        ),
      ),
    );
  }
}
