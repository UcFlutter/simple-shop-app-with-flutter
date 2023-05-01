import 'package:flutter/material.dart';

import '../models/cart.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Cart> _cartItems = {};

  Map<String, Cart> get cartItems {
    return {..._cartItems};
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, cart) {
      total += cart.price * cart.quantity;
    });
    return total;
  }

  int get itemCount {
    return _cartItems.length;
  }

  void add(String prodId, String title, double price) {
    if (_cartItems.containsKey(prodId)) {
      // Change Quantity
      _cartItems.update(
        prodId,
        (oldItem) => Cart(
          id: oldItem.id,
          title: oldItem.title,
          price: oldItem.price,
          quantity: oldItem.quantity + 1,
        ),
      );
    } else {
      _cartItems.putIfAbsent(
        prodId,
        () => Cart(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1),
      );
    }
    notifyListeners();
  }

  void removeItemFromCart(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }
}
