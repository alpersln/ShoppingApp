import 'package:flutter/material.dart';
import 'package:vsfirstapp/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String titlee;
  final String imageUrl;
  ProductItem(this.id, this.titlee, this.imageUrl);

  @override
  Widget build(BuildContext context) {
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
                ProductDetailScreen.routeName,
                arguments: id,
              );
            },
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            leading: IconButton(
              icon: Icon(Icons.favorite),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.black54,
            title: Text(
              titlee,
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
