import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/orders.dart';
import '../providers/order_provider.dart';

class OrderItem extends StatefulWidget {
  final Orders orders;

  const OrderItem({super.key, required this.orders});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context).orders;
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.orders.totalAmount.toString(),
            ),
            subtitle: Text(
              DateFormat('dd-MMM-yyyy').format(widget.orders.date),
            ),
            trailing: IconButton(
              icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
          if (_isExpanded)
            Container(
              constraints: const BoxConstraints(
                minHeight: 50,
                maxHeight: 100,
              ),
              margin: const EdgeInsets.all(10),
              color: Colors.white,
              child: ListView(
                children: widget.orders.cartItems
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e.title,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '\$${e.price} x ${e.quantity}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
