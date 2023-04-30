import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_grid.dart';
import '../widgets/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  ProductOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY SHOP'),
      ),
      body: const ProductGrid(),
    );
  }
}
