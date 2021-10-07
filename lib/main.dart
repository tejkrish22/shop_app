import 'package:flutter/material.dart';
import '../screens/products_overview_screen.dart';
import '../screens/product_details_screen.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

void main() => runApp(ShopApp());

class ShopApp extends StatefulWidget {
  ShopApp({Key? key}) : super(key: key);

  @override
  _ShopAppState createState() => _ShopAppState();
}

class _ShopAppState extends State<ShopApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
          title: "Shop",
          theme: ThemeData(
            backgroundColor: Color(0xff242037),
            primarySwatch: Colors.pink,
          ),
          home: const ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          }),
    );
  }
}
