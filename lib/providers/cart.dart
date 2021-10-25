import 'package:flutter/foundation.dart';

class CartItem {
  final String? id;
  final String? title;
  final int? quantity;
  final double? price;

  CartItem({
    @required this.id,
    @required this.price,
    @required this.quantity,
    @required this.title,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem>? _items = {};

  Map<String, CartItem>? get items {
    return {..._items!};
  }

  void addItem(String productId, double price, String title) {
    if (_items!.containsKey(productId)) {
      _items!.update(
        productId,
        (cartItem) => CartItem(
            id: cartItem.id,
            price: cartItem.price,
            quantity: cartItem.quantity! + 1,
            title: cartItem.title),
      );
    } else {
      _items!.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(),
            price: price,
            quantity: 1,
            title: title),
      );
    }
    notifyListeners();
  }

  int get itemCount {
    return _items!.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items!.forEach((key, cartItem) {
      total += cartItem.price! * cartItem.quantity!;
    });
    return total;
  }

  void removeItem(String id) {
    _items!.remove(id);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removeSingleItem(String prodId) {
    if (!_items!.containsKey(prodId)) {
      return;
    }
    if (_items![prodId]!.quantity! > 1) {
      _items!.update(
        prodId,
        (existingCartItem) => CartItem(
            id: existingCartItem.id,
            title: existingCartItem.title,
            price: existingCartItem.price,
            quantity: existingCartItem.quantity! - 1),
      );
    } else {
      _items!.remove(prodId);
    }
    notifyListeners();
  }
}
