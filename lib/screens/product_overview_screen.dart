import 'package:flutter/material.dart';
import 'package:vsfirstapp/models/product.dart';
import 'package:vsfirstapp/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("sulunshop"),
      ),
      body: ProductsGrid(),
    );
  }
}
