import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:foodapp/controllers/populer_product_controllers.dart';
import 'package:foodapp/controllers/rekom_product_controllers.dart';
import 'package:foodapp/routes/routes_helper.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    await Get.find<PopulerProductControllers>().getPopularProductList();
    await Get.find<RekomProdukController>().getRekomProdukList();
  }

  @override
  void initState() {
    super.initState();
    _loadResource();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(Duration(seconds: 3), () {
      Get.offNamed(RoutesHelper.getInitial());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: animation,
              child: Image.asset(
                'assets/image/logo part 1.png',
                width: Dimensions.splashScreen,
              ),
            ),
            Image.asset('assets/image/logo part 2.png',
                width: Dimensions.splashScreen),
          ],
        ),
      ),
    );
  }
}
