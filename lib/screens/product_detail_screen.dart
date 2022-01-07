import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsfirstapp/providers/products.dart';
import 'package:vsfirstapp/widgets/product_item.dart';

class ProductDetailScreen extends StatelessWidget {
/*   String title;

  ProductDetailScreen(this.title); */

  // static const routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; //is the id
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Container(
      child: Text("This ${loadedProduct.title}"),
    );
  }
}
