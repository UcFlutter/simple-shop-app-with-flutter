import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/product_provider.dart';

class ProductDescription extends StatelessWidget {
  static const routeName = '/description-page';
  const ProductDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('Buildc Called On Product Detail');
    final routeId = ModalRoute.of(context)?.settings.arguments as String;
    final products =
        Provider.of<ProductProvider>(context, listen: false).findById(routeId);
    return Scaffold(
      appBar: AppBar(
        title: Text(products.title),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Image.network(
              products.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '\$${products.price}',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              products.description,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
