import 'package:foodapp/controllers/populer_product_controllers.dart';
import 'package:foodapp/data/api/api_client.dart';
import 'package:foodapp/data/repository/popular_product_repo.dart';
import 'package:get/instance_manager.dart';

Future<void> init() async {
  //LOAD API CLIENT
  Get.lazyPut(() => ApiClient(appBaseUrl: 'https://dbestech.com'));
  //LOAD REPOSOTORY
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  //LOAD CONTROLLERS
  Get.lazyPut(() => PopulerProductControllers(popularProductRepo: Get.find()));
}
