class CartItem {
  final int id;
  final String name;
  final int price;
  final int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  CartItem copyWith({int? quantity}) => CartItem(
        id: id,
        name: name,
        price: price,
        quantity: quantity ?? this.quantity,
      );
}
