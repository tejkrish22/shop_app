import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/cart_item_wid.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      backgroundColor: const Color(0xff242037),
      appBar: AppBar(
        title: const Text('Your Cart!'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text("\$${cart.totalAmount}"),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Order Now"),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, i) => CartItemWid(
              id: cart.items!.values.toList()[i].id,
              price: cart.items!.values.toList()[i].price,
              quantity: cart.items!.values.toList()[i].quantity,
              title: cart.items!.values.toList()[i].title,
              productId: cart.items!.keys.toList()[i],
            ),
            itemCount: cart.items!.length,
          )),
        ],
      ),
    );
  }
}
