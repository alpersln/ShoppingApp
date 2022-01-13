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
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          Text(
            loadedProduct.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
            child: Image.network(
              loadedProduct.imageUrl,
              height: 300,
              // MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "\$${loadedProduct.price}",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 22,
            ),
          )
        ],
      ),
    );
  }
}
