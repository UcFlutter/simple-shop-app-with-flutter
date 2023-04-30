import 'package:flutter/material.dart';

import '../widgets/product_grid.dart';

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
      appBar: AppBar(
        title: const Text('MY SHOP'),
        actions: [
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
