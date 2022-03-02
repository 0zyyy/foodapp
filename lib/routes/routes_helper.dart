import 'package:foodapp/pages/food/popular_food_detail.dart';
import 'package:foodapp/pages/food/recom_food_detail.dart';
import 'package:foodapp/pages/home/main_page.dart';
import 'package:get/get.dart';

class RoutesHelper {
  static const String home = '/';
  static const String popular = '/popular-food';
  static const String rekomen = '/rekomen-food';

  static String getInitial() => '$home';
  static String getPopularPage(int pageId) => '$popular?pageId=$pageId';
  static String getRekomenPage(int pageId) => '$rekomen?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => MainPage(),
    ),
    GetPage(
        name: popular,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodPageDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: rekomen,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecomDetail(
            pageId: int.parse(pageId!),
          );
        },
        transition: Transition.fadeIn),
  ];
}
