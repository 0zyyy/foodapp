import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/big_text.dart';
import 'package:foodapp/widgets/icon_and_text.dart';
import 'package:foodapp/widgets/small_text.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  PageController pageController = PageController(viewportFraction: 0.85);
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
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPage.floor()) {
      var scale = 1 - (_currentPage - index) * (1 - _pageOffset);
      var trans = _height * (1 - scale) / 2;
      matrix = Matrix4.diagonal3Values(1, scale, 1);
      matrix = Matrix4.diagonal3Values(1, scale, 1)
        ..setTranslationRaw(0, trans, 0);
    } else if (index == _currentPage.floor() + 1) {
      var scale = _pageOffset - (_currentPage - index + 1) * (1 - _pageOffset);
      var trans = _height * (1 - scale) / 2;
      matrix = Matrix4.diagonal3Values(1, scale, 1);
      matrix = Matrix4.diagonal3Values(1, scale, 1)
        ..setTranslationRaw(0, trans, 0);
    } else if (index == _currentPage.floor() - 1) {
      var scale = 1 - (_currentPage - index) * (1 - _pageOffset);
      var trans = _height * (1 - scale) / 2;
      matrix = Matrix4.diagonal3Values(1, scale, 1)
        ..setTranslationRaw(0, trans, 0);
    } else {
      var scale = 0.8;
      var trans = _height * (1 - scale) / 2;
      matrix = Matrix4.diagonal3Values(1, scale, 1);
      matrix = Matrix4.diagonal3Values(1, scale, 1)
        ..setTranslationRaw(0, trans, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(
              left: Dimensions.width10, right: Dimensions.width10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/food${index}.png'))),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: 'Chinese Food'),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    children: [
                      Wrap(
                        children: <Widget>[
                          ...List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: AppColors.yellowColor,
                                    size: 15,
                                  )),
                        ],
                      ),
                      SizedBox(width: Dimensions.width10),
                      SmallText(text: '4.5'),
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
      Container(
        height: Dimensions.pageView,
        child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, index) => _buildPageItem(index)),
      ),
      //DOTS indicator section
      DotsIndicator(
        dotsCount: 5,
        position: _currentPage,
        decorator: DotsDecorator(
          activeColor: AppColors.mainColor,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
      SizedBox(height: Dimensions.height10),
      Container(
          margin: EdgeInsets.only(left: Dimensions.width20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular Uploads'),
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
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: SmallText(
                  text: 'Food Pairing',
                  color: Color(0xFF979797),
                ),
              )
            ],
          )),
      ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width10,
                  bottom: Dimensions.height10),
              child: Row(
                children: [
                  Container(
                    height: Dimensions.listViewImg,
                    width: Dimensions.listViewImg,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white38,
                      image: DecorationImage(
                          image: AssetImage('assets/image/food0.png')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTextContent,
                      padding: EdgeInsets.only(left: Dimensions.width5),
                      margin: EdgeInsets.only(
                          left: Dimensions.width10,
                          bottom: Dimensions.height10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            bottomRight: Radius.circular(Dimensions.radius20)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: 'Livy Kok Hot'),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            SmallText(text: 'Cino polos kyk livy'),
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
          })
    ]);
  }
}
