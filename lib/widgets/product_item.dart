import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  // ignore: use_key_in_widget_constructors
  const ProductItem(this.product);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: IconButton(
            color: Colors.red,
            icon: const Icon(Icons.favorite),
            onPressed: () => {},
          ),
          trailing: IconButton(
            color: Colors.red,
            icon: const Icon(
              Icons.shopping_bag,
            ),
            onPressed: () => {},
          ),
          title: Text(
            product.title!,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black45,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
