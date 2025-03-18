import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:serviceapp/model/cartitem_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceItemProvider extends ChangeNotifier {
  final Map<String, CartItemModel> _items = {};
  bool _isLoading = true;

  ServiceItemProvider() {
    _loadCart();
  }

  Map<String, CartItemModel> get items => _items;
  bool get isLoading => _isLoading;

  int get itemCount {
    return _items.values.fold(0, (sum, item) => sum + item.quantity);
  }

  double get totalAmount {
    return _items.values.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  void addItem(String id, String name, double price) {
    if (_items.containsKey(id)) {
      _items[id]!.quantity++;
    } else {
      _items[id] = CartItemModel(
        id: id,
        name: name,
        price: price,
        quantity: 1,
      );
    }
    notifyListeners();
    _saveCart();
  }

  void decreaseItem(String id) {
    if (!_items.containsKey(id)) return;
    if (_items[id]!.quantity > 1) {
      _items[id]!.quantity--;
    } else {
      _items.remove(id);
    }
    notifyListeners();
    _saveCart();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
    _saveCart();
  }

  bool isInCart(String id) {
    return _items.containsKey(id);
  }

  int getItemQuantity(String id) {
    return _items.containsKey(id) ? _items[id]!.quantity : 0;
  }

  Future<void> _loadCart() async {
    try {
      _isLoading = true;
      final prefs = await SharedPreferences.getInstance();
      final cartJson = prefs.getString('cart');
      if (cartJson != null) {
        final cartMap = json.decode(cartJson) as Map<String, dynamic>;
        _items.clear();
        cartMap.forEach((key, value) {
          _items[key] = CartItemModel.fromJson(value);
        });
      }
    } catch (e) {
      log("Error loading cart: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _saveCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartMap = {};
      _items.forEach((key, item) {
        cartMap[key] = item.toJson();
      });
      final cartJson = json.encode(cartMap);
      await prefs.setString('cart', cartJson);
    } catch (e) {
      log("Error saving cart: $e");
    }
  }
}
