import 'cart.dart';

class Orders {
  final String id;
  final double totalAmount;
  final List<Cart> cartItems;
  final DateTime date;

  Orders({
    required this.id,
    required this.totalAmount,
    required this.cartItems,
    required this.date,
  });
}
