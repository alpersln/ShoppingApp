import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String? imageUrl;
  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price,
      this.imageUrl});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get cartLenght {
    return _items.length;
  }

/*   String get titleForOrder {
    String tt = "-";
    _items.forEach((key, cartItem) {
      tt += cartItem.title;
    });
    return tt;
  } */

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title, String imageUrl) {
    if (_items.containsKey(productId)) {
      //change quantity
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price,
              imageUrl: existingCartItem.imageUrl));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1,
              imageUrl: imageUrl));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItemFromSnackbar(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
