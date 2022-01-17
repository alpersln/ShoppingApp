import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vsfirstapp/providers/orders.dart';
// ignore_for_file: prefer_const_constructors

class OrderItemList extends StatefulWidget {
  final OrderItem orderItem;
  // final String title;

  const OrderItemList(
    this.orderItem,
    // this.title,
  );

  @override
  State<OrderItemList> createState() => _OrderItemListState();
}

class _OrderItemListState extends State<OrderItemList> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    var mytitle = widget.orderItem.products.map((i) => i.title);
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.check,
              color: Colors.green,
            ),
            // title:Text(title),
            title: Text(mytitle.toString()),
            subtitle: Text(
                DateFormat("dd/MM/yyyy hh:mm").format(widget.orderItem.date)),
            trailing: Wrap(
              spacing: 12,
              children: [
                Text("\$${widget.orderItem.amount.toStringAsFixed(2)}"),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    },
                    icon: Icon(
                        _expanded ? Icons.expand_less : Icons.expand_more)),
              ],
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.orderItem.products.length * 20.0 + 10, 100),
              child: ListView(
                children: widget.orderItem.products
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            prod.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${prod.quantity}x \$${prod.price}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
