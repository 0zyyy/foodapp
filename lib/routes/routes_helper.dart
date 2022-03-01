import 'package:foodapp/pages/food/popular_food_detail.dart';
import 'package:foodapp/pages/home/main_page.dart';
import 'package:get/get.dart';

class RoutesHelper {
  static const String home = '/';
  static const String popular = '/popular';
  List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => MainPage(),
    ),
    GetPage(name: popular, page: () => PopularFoodPageDetail()),
  ];
}
