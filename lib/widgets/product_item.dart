import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../screens/product_details_screen.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (context, value, _) => IconButton(
              color: Colors.red,
              icon: product.isFavorite!
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border_outlined),
              onPressed: product.toggleFavorite,
            ),
          ),
          trailing: IconButton(
            color: Colors.red,
            icon: const Icon(
              Icons.shopping_bag,
            ),
            onPressed: () {
              cart.addItem(
                product.id!,
                product.price!,
                product.title!,
              );
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Added Item to Cart'),
                duration: const Duration(seconds: 2),
                action: SnackBarAction(
                  label: "Undo",
                  onPressed: () {
                    cart.removeItem(product.id!);
                  },
                ),
              ));
            },
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
