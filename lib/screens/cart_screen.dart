import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Consumer<CartProvider>(
                      builder: (context, value, child) => Chip(
                        label: Text(
                          '\$${value.totalAmount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white,
                            // fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text('ORDER NOW'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Consumer<CartProvider>(
              builder: (context, cart, child) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => CartItem(
                      id: (cart.cartItems.values.toList())[index].id,
                      productId: (cart.cartItems.keys.toList())[index],
                      title: (cart.cartItems.values.toList())[index].title,
                      price: (cart.cartItems.values.toList()[index].price),
                      quantity:
                          (cart.cartItems.values.toList()[index].quantity),
                    ),
                    itemCount: cart.itemCount,
                  ),
                );
              },
            ),
          ],
        ));
  }
}
