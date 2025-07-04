import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodzy/persentation/vendor_screen/bloc/cart_cubit.dart';

///
///
///
///        /// This widget displays a summary of the cart at the bottom of the screen.
///
///
class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  final double _cartSummaryHeight = 90;

  @override
  Widget build(BuildContext context) {
    final CartCubit cartModel = context.watch<CartCubit>();
    final int totalItems = cartModel.totalItems;
    final double totalPrice = cartModel.totalPrice;

    if (totalItems == 0) {
      return const SizedBox.shrink();
    }

    return Container(
      height: _cartSummaryHeight,
      decoration: BoxDecoration(
        color: Colors.green[700],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '$totalItems Item(s) • \$${totalPrice.toStringAsFixed(0)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: // Navigate to the cart page
                },
                icon: const Icon(Icons.shopping_basket, color: Colors.green),
                label: const Text(
                  'View Cart',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Extra Charges may apply',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
