// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsfirstapp/providers/product.dart';
import 'package:vsfirstapp/providers/products.dart';
import 'package:vsfirstapp/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("sulunshop"),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text("Only Favorites"),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                        child: Text("Show All"), value: FilterOptions.All)
                  ])
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}

enum FilterOptions {
  Favorites,
  All,
}
