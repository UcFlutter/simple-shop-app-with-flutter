import 'package:flutter/material.dart';

import '../models/cart.dart';
import '../models/orders.dart';

class OrderProvider with ChangeNotifier {
  List<Orders> _orders = [];

  List<Orders> get orders {
    return [..._orders];
  }

  void addOrders(List<Cart> cartProducts, double total) {
    _orders.insert(
      0,
      Orders(
        id: DateTime.now().toString(),
        totalAmount: total,
        cartItems: cartProducts,
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
