import 'package:flutter/material.dart';
import 'package:foodapp/data/repository/popular_product_repo.dart';
import 'package:foodapp/models/product_model.dart';
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

  int _quantity = 0;
  int get quantity => _quantity;
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
    if (quantity <= 0) {
      return 0;
    } else if (quantity > 20) {
      return 20;
    }
    update();
    return quantity;
  }
}
