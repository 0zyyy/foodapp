import 'package:flutter/material.dart';
import 'package:foodapp/data/repository/cart_product_repo.dart';
import 'package:foodapp/models/cart_model.dart';
import 'package:foodapp/models/product_model.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  //CART CONTROLLER

  int _cartCount = 0;
  int get cartCount => _cartCount;
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;
  void increment() {
    _cartCount++;
  }

  void decrement() {
    _cartCount--;
  }

  void addItem(ProductModel produk, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(produk.id)) {
      _items.update(produk.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toIso8601String(),
            product: produk);
      });
      if (totalQuantity <= 0) {
        _items.remove(produk.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(produk.id!, () {
          print('ADDED TO CART ' +
              produk.id.toString() +
              ' Sebanyak ' +
              quantity.toString());
          return CartModel(
              id: produk.id,
              name: produk.name,
              price: produk.price,
              img: produk.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toIso8601String(),
              product: produk);
        });
      } else {
        Get.snackbar('Ada Masalah', 'Silahkan menambahkan kuantitas',
            backgroundColor: AppColors.mainColor,
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            colorText: Colors.white);
      }
    }
    update();
  }

  bool existInCart(ProductModel produk) {
    if (_items.containsKey(produk.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductModel produk) {
    var quantity = 0;
    if (_items.containsKey(produk.id!)) {
      _items.forEach((key, value) {
        if (value.id == produk.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity!;
    });
    return total;
  }

  List<CartModel> get getItems {
    return _items.entries.map((cart) => cart.value).toList();
  }
}
