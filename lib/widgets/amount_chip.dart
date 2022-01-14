// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsfirstapp/providers/cart.dart';
import 'package:vsfirstapp/providers/orders.dart';

class AmountChip extends StatelessWidget {
  const AmountChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Card(
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: TextStyle(fontSize: 20),
            ),
            Spacer(),
            Chip(
              //elevation: 8.0,
              padding: EdgeInsets.all(2.0),
              avatar: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.monetization_on_outlined,
                  color: Theme.of(context).primaryTextTheme.bodyText1!.color,
                  size: 20,
                ),
              ),
              label: Text(
                cart.totalAmount.toStringAsFixed(2),
                style: TextStyle(
                    color: Theme.of(context).primaryTextTheme.bodyText1!.color),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              shape: StadiumBorder(
/*                 side: BorderSide(
                  width: 1,
                  color: Theme.of(context).primaryColor,
                ), */
                  ),
            ),
            SizedBox(
              width: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Provider.of<Orders>(context, listen: false).addOrder(
                  cart.items.values.toList(),
                  cart.totalAmount,
                  //         cart.titleForOrder
                );
                cart.clear();
              },
              child: const Text('ORDER NOW'),
            ),
          ],
        ),
      ),
    );
  }
}
