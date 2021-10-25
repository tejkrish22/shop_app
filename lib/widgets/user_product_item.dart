import 'package:flutter/material.dart';
import '../screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  const UserProductItem({
    Key? key,
    this.title,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title!,
        style: const TextStyle(color: Colors.white),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl!),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductScreen.routeName);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.pink,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                )),
          ],
        ),
      ),
    );
  }
}
