import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;
  // HEIGHT for margin and padding
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;

// WIDTH FOR MARGIN AND PADDING
  static double width5 = screenHeight / (844 / 5);
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;

  //RADIUS
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  //ICON SIZE
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;
  static double iconSize12 = screenHeight / (35.17 / 2);

  //LIST VIEW img
  static double listViewImg = screenWidth / 3.25;
  static double listViewTextContent = screenWidth / 3.9;

  //SPLASH SCREEN
  static double splashScreen = screenHeight / 3.38;

  //FOOD PAGE DETAIL
  static double PopularImgSize = screenHeight / 2.41;

  //BOTTOM NAVBAR HEIGHT
  static double NavbarHeight = screenHeight / 7.03;
}
