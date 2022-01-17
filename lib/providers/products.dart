import 'package:flutter/cupertino.dart';
import 'package:vsfirstapp/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'Star Trek TNG Red Shirt Uniform ',
      price: 29.99,
      imageUrl:
          'https://ae01.alicdn.com/kf/HTB1_6VhcBGw3KVjSZFwq6zQ2FXaJ/Star-TNG-The-Next-Generation-Trek-Red-Shirt-Uniform-Cosplay-Costume-For-Men-Coat-Halloween-Party.jpg_Q90.jpg_.webp',
    ),
    Product(
      id: 'p2',
      title: 'Shoes',
      description: 'Nike Kobe 7 USA Olympic Team Shoes.',
      price: 59.99,
      imageUrl:
          'https://di2ponv0v5otw.cloudfront.net/posts/2020/01/28/5e304a82eeb523dfc22f449c/m_5e304a86264a5577064c1f22.jpeg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Chair',
      description: 'Touchwood bar chair, 75 cm, black steel.',
      price: 49.99,
      imageUrl:
          'https://media.fds.fi/product_image/800/Touchwood-baarijakkara-75-cm-musta-musta-teras.jpg',
    ),
  ];

  List<Product> get items {
/*     if (_showFavoritesOnly) {
      return _items.where((i) => i.isFavorite).toList();
    } */
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((i) => i.isFavorite).toList();
  }

/*  
var _showFavoritesOnly = false;

 void showFavorites() {
    _showFavoritesOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoritesOnly = false;
    notifyListeners();
  } */

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
