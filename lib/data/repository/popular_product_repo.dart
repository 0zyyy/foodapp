import 'package:foodapp/data/api/api_client.dart';
import 'package:foodapp/utils/app_const.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});
  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstatns.POPULAR_PRODUCT);
  }
}
