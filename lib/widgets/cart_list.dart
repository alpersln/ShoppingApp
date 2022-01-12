import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsfirstapp/providers/cart.dart';
import 'package:vsfirstapp/widgets/cart_listTile.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartItemList = cart.items.values.toList();
    return Expanded(
      child: ListView.builder(
        itemCount: cart.cartLenght,
        itemBuilder: (ctx, i) => CartListTile(
          cartItemList[i].id,
          cartItemList[i].title,
          cartItemList[i].quantity,
          cartItemList[i].price,
          cartItemList[i].imageUrl!,
        ),
      ),
    );
  }
}
