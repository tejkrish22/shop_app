import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_revision/providers/products.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool? showFavs;
  // ignore: use_key_in_widget_constructors
  const ProductsGrid({@required this.showFavs, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs! ? productsData.favs : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(
          key: ValueKey(products[i].id),
        ),
      ),
    );
  }
}
