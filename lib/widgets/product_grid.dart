import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool isFavorites;

  const ProductGrid({super.key, required this.isFavorites});

  @override
  Widget build(BuildContext context) {
    print('Build Called On Product Grid');
    final loadedProduct = Provider.of<ProductProvider>(context);
    final products =
        isFavorites ? loadedProduct.favoritesOnly : loadedProduct.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: const ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10,
      ),
    );
  }
}
