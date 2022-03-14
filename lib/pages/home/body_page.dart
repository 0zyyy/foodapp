import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/controllers/populer_product_controllers.dart';
import 'package:foodapp/controllers/rekom_product_controllers.dart';
import 'package:foodapp/data/repository/popular_product_repo.dart';
import 'package:foodapp/models/product_model.dart';
import 'package:foodapp/pages/food/popular_food_detail.dart';
import 'package:foodapp/routes/routes_helper.dart';
import 'package:foodapp/utils/app_const.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/big_text.dart';
import 'package:foodapp/widgets/icon_and_text.dart';
import 'package:foodapp/widgets/small_text.dart';
import 'package:get/get.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  PageController pageController = PageController(viewportFraction: 0.80);
  var _currentPage = 0.0;
  double _pageOffset = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPage = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPage.floor()) {
      var currScale = 1 - (_currentPage - index) * (1 - _pageOffset);
      var trans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, trans, 0);
    } else if (index == _currentPage.floor() + 1) {
      var currScale =
          _pageOffset + (_currentPage - index + 1) * (1 - _pageOffset);
      var trans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, trans, 0);
    } else if (index == _currentPage.floor() - 1) {
      var currScale =
          _pageOffset + (_currentPage - index - 1) * (1 - _pageOffset);
      var trans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, trans, 0);
    } else {
      var currScale = 0.8;
      var trans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, trans, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(RoutesHelper.getPopularPage(index, 'home'));
          },
          child: Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstatns.BASE_URL +
                        '/uploads/' +
                        popularProduct.img!))),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height30),
            padding: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      offset: Offset(0, 5),
                      blurRadius: 5.0),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                    blurRadius: 5.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                    blurRadius: 5.0,
                  ),
                ]),
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  left: Dimensions.width15,
                  right: Dimensions.width15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: popularProduct.name!),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    children: [
                      Wrap(
                        children: <Widget>[
                          ...List.generate(
                              popularProduct.stars!,
                              (index) => Icon(
                                    Icons.star,
                                    color: AppColors.yellowColor,
                                    size: 15,
                                  )),
                        ],
                      ),
                      SizedBox(width: Dimensions.width10),
                      SmallText(text: popularProduct.stars!.toString()),
                      SizedBox(width: Dimensions.width10),
                      SmallText(text: '1287'),
                      SizedBox(width: Dimensions.width10),
                      SmallText(text: 'Comment')
                    ],
                  ),
                  SizedBox(height: Dimensions.height20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndText(
                          icon: Icons.circle_sharp,
                          text: 'Normal',
                          IconColor: AppColors.iconColor1),
                      SizedBox(width: Dimensions.width10),
                      IconAndText(
                          icon: Icons.location_on,
                          text: '1.7km',
                          IconColor: AppColors.mainColor),
                      SizedBox(width: Dimensions.width10),
                      IconAndText(
                          icon: Icons.access_time_rounded,
                          text: '32min ',
                          IconColor: AppColors.iconColor2),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //Slider section
      GetBuilder<PopulerProductControllers>(builder: (popularProduct) {
        return popularProduct.isLoading
            // ignore: sized_box_for_whitespace
            ? Container(
                height: Dimensions.pageView,
                child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProduct.popularProductList.length,
                    itemBuilder: (context, index) => _buildPageItem(
                        index, popularProduct.popularProductList[index])),
              )
            : CircularProgressIndicator(
                color: AppColors.mainColor,
              );
      }),
      //DOTS indicator section
      GetBuilder<PopulerProductControllers>(builder: (popularProducts) {
        return DotsIndicator(
            dotsCount: popularProducts.popularProductList.length <= 0
                ? 1
                : popularProducts.popularProductList.length,
            position: _currentPage,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ));
      }),
      // POPULAR section
      SizedBox(
        height: Dimensions.height10,
      ),
      Container(
          margin: EdgeInsets.only(
              left: Dimensions.width20, top: Dimensions.height10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Rekomendasi'),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
            ],
          )),
      GetBuilder<RekomProdukController>(builder: (rekomProduk) {
        return rekomProduk.isLoading
            ? Container(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: rekomProduk.rekomProdukList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width10,
                          bottom: Dimensions.height10,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(RoutesHelper.getRekomenPage(
                                    index, 'rekomen'));
                              },
                              child: Container(
                                height: Dimensions.listViewImg,
                                width: Dimensions.listViewImg,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          AppConstatns.BASE_URL +
                                              '/uploads/' +
                                              rekomProduk
                                                  .rekomProdukList[index].img)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: Dimensions.listViewTextContent,
                                padding:
                                    EdgeInsets.only(left: Dimensions.width5),
                                margin: EdgeInsets.only(
                                    left: Dimensions.width10,
                                    bottom: Dimensions.height10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(Dimensions.radius15),
                                      bottomRight:
                                          Radius.circular(Dimensions.radius15)),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: Dimensions.width10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(
                                          text: rekomProduk
                                              .rekomProdukList[index].name),
                                      SizedBox(
                                        height: Dimensions.height10,
                                      ),
                                      SmallText(text: 'Bakekok'),
                                      SizedBox(
                                        height: Dimensions.height10,
                                      ),
                                      Row(
                                        children: [
                                          IconAndText(
                                            icon: Icons.circle_sharp,
                                            text: 'Normal',
                                            IconColor: AppColors.iconColor1,
                                          ),
                                          IconAndText(
                                              icon: Icons.location_on,
                                              text: '1.7km',
                                              IconColor: AppColors.mainColor),
                                          IconAndText(
                                              icon: Icons.access_time_rounded,
                                              text: '32min ',
                                              IconColor: AppColors.iconColor2),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            : CircularProgressIndicator(
                color: AppColors.mainColor,
              );
      }),
    ]);
  }
}
