import 'package:foodapp/data/repository/popular_product_repo.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PopulerProductControllers extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopulerProductControllers({
    required this.popularProductRepo,
  });
  List<dynamic> _poplarProductList = [];
  List<dynamic> get popularProduct => _poplarProductList;
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProduct();
    if (response.status == 200) {
      _poplarProductList = [];
      // _poplarProductList.addAll();
      update();
    } else {}
  }
}
