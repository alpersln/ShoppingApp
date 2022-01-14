import 'package:flutter/cupertino.dart';
import 'package:vsfirstapp/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime date;
  // final String title;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.date,
    //    required this.title
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get order {
    return [..._orders];
  }

  void addOrder(
    List<CartItem> cartProducts,
    double totalAmount,
  ) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: totalAmount,
        products: cartProducts,
        date: DateTime.now(),
        //   title: title,
      ),
    );
    notifyListeners();
  }
}
