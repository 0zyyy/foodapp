import 'package:flutter/material.dart';
import 'package:foodapp/controllers/cart_product_controller.dart';
import 'package:foodapp/data/repository/popular_product_repo.dart';
import 'package:foodapp/models/cart_model.dart';
import 'package:foodapp/models/product_model.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PopulerProductControllers extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopulerProductControllers({
    required this.popularProductRepo,
  });
  List<dynamic> _poplarProductList = [];
  List<dynamic> get popularProductList => _poplarProductList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  var exist = false;
  late CartController _cart;
  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItem = 0;
  int get inCartItem => _inCartItem + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode != null) {
      // ignore: avoid_print
      print('get object');
      _poplarProductList = [];
      _poplarProductList.addAll(Product.fromJson(response.body).products);
      // ignore: avoid_print
      _isLoading = true;
      // print(_poplarProductList);
      update();
    } else {
      print('object not found');
    }
  }

  void setQuantity(bool isTambah) {
    if (isTambah) {
      print('tambah');
      _quantity = cekQuantity(_quantity + 1);
    } else {
      print('kurang');
      _quantity = cekQuantity(_quantity - 1);
    }
    update();
  }

  int cekQuantity(int quantity) {
    if ((_inCartItem + quantity) < 0) {
      Get.snackbar('Tidak bisa mengurangi lagi', 'Nol adalah paling minimum',
          backgroundColor: AppColors.mainColor,
          icon: Icon(Icons.close, color: Colors.white));
      return 0;
    } else if ((_inCartItem + quantity) > 20) {
      Get.snackbar('Tidak bisa menambah lagi', 'Maksimum pembelian',
          backgroundColor: AppColors.mainColor,
          icon: Icon(Icons.close, color: Colors.white));
      return 20;
    }
    update();
    return quantity;
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cart;
    exist = _cart.existInCart(product);

    if (exist) {
      _inCartItem = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel produk) {
    // if (_quantity > 0) {
    _cart.addItem(produk, _quantity);
    _quantity = 0;
    _inCartItem = _cart.getQuantity(produk);
    _cart.items.forEach((keys, value) {
      print('Produk id ' +
          value.id.toString() +
          ' quantity ' +
          value.quantity.toString());
    });
    update();
    // } else {

    // }
  }

  int get getTotalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getCartItems {
    return _cart.getItems;
  }
}
