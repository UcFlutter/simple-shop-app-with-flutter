import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';

import '../models/product.dart';

import '../providers/cart_provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    print('Build Called On Product Item');
    final productProvider = Provider.of<Product>(context);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDescription.routeName,
          arguments: productProvider.id,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
            title: Text(
              productProvider.title,
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
              onPressed: () {
                productProvider.toggleFavorite();
              },
              icon: Icon(
                productProvider.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              color: Colors.deepOrange,
            ),
            trailing: IconButton(
              onPressed: () {
                cartProvider.add(
                  productProvider.id,
                  productProvider.title,
                  productProvider.price,
                );
              },
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
            ),
            backgroundColor: Colors.black87,
          ),
          child: Image.network(
            productProvider.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
