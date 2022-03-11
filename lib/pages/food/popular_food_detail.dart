import 'package:flutter/material.dart';
import 'package:foodapp/controllers/cart_product_controller.dart';
import 'package:foodapp/controllers/populer_product_controllers.dart';
import 'package:foodapp/models/product_model.dart';
import 'package:foodapp/pages/home/main_page.dart';
import 'package:foodapp/routes/routes_helper.dart';
import 'package:foodapp/utils/app_const.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/app_column.dart';
import 'package:foodapp/widgets/app_icon.dart';
import 'package:foodapp/widgets/big_text.dart';
import 'package:foodapp/widgets/expandable_text.dart';
import 'package:foodapp/widgets/small_text.dart';
import 'package:get/get.dart';

class PopularFoodPageDetail extends StatelessWidget {
  int pageId;
  PopularFoodPageDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var produk =
        Get.find<PopulerProductControllers>().popularProductList[pageId];
    Get.find<PopulerProductControllers>()
        .initProduct(produk, Get.find<CartController>());
    // print(produk.img);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.PopularImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      AppConstatns.BASE_URL + "/uploads/" + produk.img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesHelper.getInitial());
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  GetBuilder<PopulerProductControllers>(builder: (controller) {
                    return Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined),
                        Get.find<PopulerProductControllers>().getTotalItems >= 1
                            ? Positioned(
                                top: 0,
                                right: 0,
                                child: AppIcon(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconColor: Colors.transparent,
                                  backgroundColor: AppColors.mainColor,
                                ),
                              )
                            : Container(),
                        Get.find<PopulerProductControllers>().getTotalItems >= 1
                            ? Positioned(
                                top: 3,
                                right: 3,
                                child: BigText(
                                  size: 12,
                                  color: Colors.white,
                                  text: Get.find<PopulerProductControllers>()
                                      .getTotalItems
                                      .toString(),
                                ),
                              )
                            : Container(),
                      ],
                    );
                  })
                ],
              )),
          Positioned(
            top: Dimensions.PopularImgSize - 20.0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              height: 900,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius30),
                  topRight: Radius.circular(Dimensions.radius30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: produk.name),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: 'Deskripsi'),
                  SizedBox(height: Dimensions.height10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(text: produk.description),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
        bottomNavigationBar:
            GetBuilder<PopulerProductControllers>(builder: (popularProduct) {
          return Container(
            height: Dimensions.NavbarHeight,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        right: Dimensions.width20,
                        left: Dimensions.width20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child: Icon(
                            Icons.remove,
                            color: AppColors.signColor,
                          ),
                        ),
                        SizedBox(width: Dimensions.width10 / 2),
                        BigText(text: popularProduct.inCartItem.toString()),
                        SizedBox(width: Dimensions.width10 / 2),
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(
                            Icons.add,
                            color: AppColors.signColor,
                          ),
                        )
                      ],
                    )),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      right: Dimensions.width20,
                      left: Dimensions.width20),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      popularProduct.addItem(produk);
                    },
                    child: BigText(
                      text: '\$ ${produk.price} Add to Cart',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
