import 'dart:convert';

import 'package:foodapp/models/cart_model.dart';
import 'package:foodapp/utils/app_const.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo extends GetxService {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];
    // Add to shared prefernces
    cartList.forEach((element) {
      return cart.add(jsonEncode(element));
    });
    sharedPreferences.setStringList(AppConstatns.CART, cart);
  }

  List<CartModel> getCartList() {
    List<CartModel> cartList = [];
    List<String> cart = [];
    if (sharedPreferences.containsKey(AppConstatns.CART)) {
      cart = sharedPreferences.getStringList(AppConstatns.CART)!;
    }
    cart.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartList;
  }
}
