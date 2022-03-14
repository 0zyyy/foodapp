import 'package:foodapp/controllers/cart_product_controller.dart';
import 'package:foodapp/controllers/populer_product_controllers.dart';
import 'package:foodapp/controllers/rekom_product_controllers.dart';
import 'package:foodapp/data/api/api_client.dart';
import 'package:foodapp/data/repository/cart_product_repo.dart';
import 'package:foodapp/data/repository/popular_product_repo.dart';
import 'package:foodapp/data/repository/rekom_product_repo.dart';
import 'package:foodapp/utils/app_const.dart';
import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  //LOAD API CLIENT
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstatns.BASE_URL));
  //LOAD REPOSOTORY
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RekomProdukRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  //LOAD CONTROLLERS
  Get.lazyPut(() => PopulerProductControllers(popularProductRepo: Get.find()));
  Get.lazyPut(() => RekomProdukController(rekomProdukRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
