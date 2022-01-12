import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsfirstapp/providers/cart.dart';
import 'package:vsfirstapp/providers/product.dart';

class ProductItem extends StatelessWidget {
/*   final String id;
  final String titlee;
  final String imageUrl;
  ProductItem(this.id, this.titlee, this.imageUrl); */

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          child: GestureDetector(
            onTap: () {
/*               Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (cxt) => ProductDetailScreen(),
                ),
              ); */
              Navigator.of(context).pushNamed(
                  //  ProductDetailScreen.routeName,
                  '/productDetailSc',
                  arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            leading: Consumer<Product>(
              builder: (context, product, child) => IconButton(
                icon: product.isFavorite
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  product.toggleFavorite();
                },
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                cart.addItem(
                    product.id, product.price, product.title, product.imageUrl);
              },
            ),
            backgroundColor: Colors.black54,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
