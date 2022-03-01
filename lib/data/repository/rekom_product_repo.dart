import 'package:foodapp/data/api/api_client.dart';
import 'package:foodapp/utils/app_const.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RekomProdukRepo extends GetxService {
  final ApiClient apiClient;
  RekomProdukRepo({required this.apiClient});

  Future<Response> getRekomProdukList() async {
    return await apiClient.getData(AppConstatns.RECOMMEND_PRODUCT);
  }
}
