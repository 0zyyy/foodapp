import 'package:foodapp/pages/cart/cart_pages.dart';
import 'package:foodapp/pages/food/popular_food_detail.dart';
import 'package:foodapp/pages/food/recom_food_detail.dart';
import 'package:foodapp/pages/home/main_page.dart';
import 'package:get/get.dart';

class RoutesHelper {
  static const String home = '/';
  static const String popular = '/popular-food';
  static const String rekomen = '/rekomen-food';
  static const String cartPage = '/cart-page';

  static String getInitial() => '$home';
  static String getPopularPage(int pageId, String page) =>
      '$popular?pageId=$pageId&page=$page';
  static String getRekomenPage(int pageId, String page) =>
      '$rekomen?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => MainPage(),
    ),
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: popular,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodPageDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: rekomen,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecomDetail(
            pageId: int.parse(pageId!),
            page: page!,
          );
        },
        transition: Transition.fadeIn),
  ];
}
