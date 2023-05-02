import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './cart_screen.dart';

import '../widgets/product_grid.dart';
import '../widgets/app_drawer.dart';

import '../providers/cart_provider.dart';

enum FilteringOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavorites = false;

  @override
  Widget build(BuildContext context) {
    print('Build Called On Product Overview');
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('MY SHOP'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Badge(
                label: Text(cart.itemCount.toString()),
                alignment: AlignmentDirectional.bottomStart,
                largeSize: 20,
                child: child,
              );
            },
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: FilteringOptions.All,
                child: Text('Show All Products'),
              ),
              const PopupMenuItem(
                value: FilteringOptions.Favorites,
                child: Text('Show Favorites'),
              ),
            ],
            onSelected: (FilteringOptions value) {
              setState(() {
                if (value == FilteringOptions.Favorites) {
                  _showFavorites = true;
                } else {
                  _showFavorites = false;
                }
              });
            },
          ),
        ],
      ),
      body: ProductGrid(
        isFavorites: _showFavorites,
      ),
    );
  }
}
