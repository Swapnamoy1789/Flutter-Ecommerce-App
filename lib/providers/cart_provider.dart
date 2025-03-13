import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartProvider with ChangeNotifier {
  final Map<int, Product> _cartItems = {};

  Map<int, Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems[product.id] = product;
    notifyListeners();
  }

  void removeFromCart(int id) {
    _cartItems.remove(id);
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.values.fold(0, (sum, item) => sum + item.price);
  }
}
