import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodzy/domain/vendors_screen/model/cart_item.dart';
import 'package:foodzy/persentation/vendor_screen/bloc/state/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<CartItem> _items = [];

  int get totalItems => _items.fold(
      0, (previousValue, element) => previousValue + element.quantity);

  double get totalPrice => _items.fold(
      0.0,
      (previousValue, element) =>
          previousValue + (element.price * element.quantity));

  bool get isCartEmpty => _items.isEmpty;

  void addItem(CartItem newItem) {
    final index = _items.indexWhere((item) => item.id == newItem.id);

    if (index != -1) {
      _items[index] =
          _items[index].copyWith(quantity: _items[index].quantity + 1);
    } else {
      _items.add(newItem);
    }

    emit(CartUpdated(List.from(_items)));
  }

  void removeItem(int id) {
    _items.removeWhere((item) => item.id == id);
    emit(CartUpdated(List.from(_items)));
  }

  void clearCart() {
    _items.clear();
    emit(CartUpdated(List.from(_items)));
  }

  void decreaseQuantity(int id) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index != -1 && _items[index].quantity > 1) {
      _items[index] =
          _items[index].copyWith(quantity: _items[index].quantity - 1);
    } else {
      _items.removeAt(index);
    }
    emit(CartUpdated(List.from(_items)));
  }

  int getItemQuantity(int item) {
    return _items
        .firstWhere((cartItem) => cartItem.id == item,
            orElse: () => CartItem(id: 0, name: '', price: 0, quantity: 0))
        .quantity;
  }
}
