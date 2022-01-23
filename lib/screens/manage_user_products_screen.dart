import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsfirstapp/providers/products.dart';
import 'package:vsfirstapp/widgets/app_drawer.dart';
import 'package:vsfirstapp/widgets/manage_product_item.dart';

class ManageUserProductScreen extends StatelessWidget {
  const ManageUserProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Products"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/manageEditProductScreen');
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, i) => ManageProductItem(
            productsData.items[i].title,
            productsData.items[i].imageUrl,
          ),
        ),
      ),
    );
  }
}
