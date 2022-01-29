import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:vsfirstapp/providers/cart.dart';
import 'package:http/http.dart' as http;

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

  Future<void> fetchAndSetOrders() async {
    final url = Uri.parse(
        'https://shopapp-15e24-default-rtdb.europe-west1.firebasedatabase.app/orders.json');

    final response = await http.get(url);
    final List<OrderItem> loadedOrders = [];
    // map as dynamicliyi silp dene
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(OrderItem(
        id: orderId,
        amount: orderData['amount'],
        products: (orderData['products'] as List<dynamic>)
            .map((e) => CartItem(
                id: e['id'],
                title: e['title'],
                quantity: e['quantity'],
                price: e['price']))
            .toList(),
        date: DateTime.parse(orderData['date']),
      ));
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double totalAmount) async {
    final timestamp = DateTime.now();
    final url = Uri.parse(
        'https://shopapp-15e24-default-rtdb.europe-west1.firebasedatabase.app/orders.json');
    final response = await http.post(
      url,
      body: json.encode({
        //   'id':json.decode(response.body)['name'],
        'amount': totalAmount,
        'products': cartProducts
            .map((e) => {
                  'id': e.id,
                  'title': e.title,
                  'quantity': e.quantity,
                  'price': e.price
                })
            .toList(),
        'date': timestamp.toIso8601String(),
      }),
    );

    _orders.insert(
      0,
      OrderItem(
        id: json.decode(response.body)['name'],
        amount: totalAmount,
        products: cartProducts,
        date: timestamp,
        //   title: title,
      ),
    );
    notifyListeners();
  }
}
