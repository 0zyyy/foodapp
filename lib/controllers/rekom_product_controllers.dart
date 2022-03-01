import 'package:flutter/material.dart';
import 'package:foodapp/data/repository/popular_product_repo.dart';
import 'package:foodapp/data/repository/rekom_product_repo.dart';
import 'package:foodapp/models/product_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RekomProdukController extends GetxController {
  final RekomProdukRepo rekomProdukRepo;
  RekomProdukController({
    required this.rekomProdukRepo,
  });
  List<dynamic> _rekomProdukList = [];
  List<dynamic> get rekomProdukList => _rekomProdukList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getRekomProdukList() async {
    Response response = await rekomProdukRepo.getRekomProdukList();
    if (response.statusCode == 200) {
      _rekomProdukList = [];
      _rekomProdukList.addAll(Product.fromJson(response.body).products);
      _isLoading = true;
      update();
    }
  }
}
