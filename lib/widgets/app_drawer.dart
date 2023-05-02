import 'package:flutter/material.dart';

import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Welcome User'),
            automaticallyImplyLeading: false,
            toolbarHeight: 200,
          ),
          const Text(
            'Welcome',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            title: Text('SHOP'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('ORDERS'),
            onTap: () {
              Navigator.pushNamed(context, OrdersScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
