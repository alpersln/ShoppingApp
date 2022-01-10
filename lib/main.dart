import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsfirstapp/providers/cart.dart';
import 'package:vsfirstapp/providers/products.dart';
import 'package:vsfirstapp/screens/cart_screen.dart';
import 'package:vsfirstapp/screens/product_detail_screen.dart';
import 'package:vsfirstapp/screens/product_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        )
      ],

      //  create: (ctx) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.pink[200],
            fontFamily: "Lato"),
        home: ProductsOverviewScreen(),
        routes: {
          //  ProductDetailScreen.routeName: (ctx) => ProductDetailScreen()
          '/productDetailSc': (ctx) => ProductDetailScreen(),
          '/cartScreen': (ctx) => CartScreen(),
        },
      ),
    );
  }
}
