import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class CartListTile extends StatelessWidget {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;
  CartListTile(this.id, this.title, this.quantity, this.price, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: Image.network(
            imageUrl,
            height: 60,
            width: 60,
          ),
          title: Text(title),
          trailing: Wrap(
            spacing: 12,
            children: [
              Text(
                "${quantity}x",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                price.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
