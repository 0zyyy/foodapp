import 'package:flutter/material.dart';
import 'package:foodapp/controllers/populer_product_controllers.dart';
import 'package:foodapp/controllers/rekom_product_controllers.dart';
import 'package:foodapp/pages/cart/cart_pages.dart';
import 'package:foodapp/pages/food/popular_food_detail.dart';
import 'package:foodapp/pages/food/recom_food_detail.dart';
import 'package:foodapp/pages/home/main_page.dart';
import 'package:foodapp/pages/splash/splash_screen.dart';
import 'package:foodapp/routes/routes_helper.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:foodapp/helper/dependencies.dart' as dp;
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dp.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopulerProductControllers>(builder: (_) {
      return GetBuilder<RekomProdukController>(builder: (_) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: SplashScreen(),
          initialRoute: RoutesHelper.getSplashScreen(),
          getPages: RoutesHelper.routes,
        );
      });
    });
  }
}
