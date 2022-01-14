import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsfirstapp/providers/orders.dart';
import 'package:vsfirstapp/widgets/app_drawer.dart';
import 'package:vsfirstapp/widgets/order_item_list.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.order.length,
        itemBuilder: (ctx, i) => OrderItemList(
          orderData.order[i],
          // orderData.order.toList()[i].title,
        ),
      ),
    );
  }
}
