import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loadedProduct = Provider.of<ProductProvider>(context).items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProduct.length,
      itemBuilder: (context, index) => ProductItem(
        id: loadedProduct[index].id,
        title: loadedProduct[index].title,
        imageUrl: loadedProduct[index].imageUrl,
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
