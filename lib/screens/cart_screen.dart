import 'package:flutter/material.dart';
import 'package:vsfirstapp/widgets/amount_chip.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: Column(
        children: [AmountChip()],
      ),
    );
  }
}
