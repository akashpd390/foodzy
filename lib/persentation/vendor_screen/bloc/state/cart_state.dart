import 'package:foodzy/domain/vendors_screen/model/cart_item.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<CartItem> items;

  CartUpdated(this.items);

  double get totalPrice =>
      items.fold(0, (sum, item) => sum + (item.price * item.quantity));
}
