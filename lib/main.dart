import 'package:flutter/material.dart';
import '../screens/products_overview_screen.dart';
import '../screens/product_details_screen.dart';
import '../providers/products.dart';
import '../providers/cart.dart';
import '../providers/orders.dart';
import 'package:provider/provider.dart';
import '../screens/cart_screen.dart';
import '../screens/orders_screen.dart';

void main() => runApp(const ShopApp());

class ShopApp extends StatefulWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  _ShopAppState createState() => _ShopAppState();
}

class _ShopAppState extends State<ShopApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Shop",
        theme: ThemeData(
          backgroundColor: const Color(0xff242037),
          primarySwatch: Colors.pink,
        ),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
        },
      ),
    );
  }
}
