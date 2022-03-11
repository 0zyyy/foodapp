import 'package:get/get.dart';

class CartRepo extends GetxService {
  RxInt _cartCount = 0.obs;
  RxInt get cartCount => _cartCount;
  Map<int, dynamic> _cart = {};
  void addToCart() {
    _cartCount.value++;
  }
}
