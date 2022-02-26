import 'package:flutter/material.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/app_icon.dart';
import 'package:foodapp/widgets/big_text.dart';

class PopularFoodPageDetail extends StatelessWidget {
  const PopularFoodPageDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            width: double.maxFinite,
            height: Dimensions.PopularImgSize,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/food2.png'),
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
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.close_outlined),
              ],
            )),
        Positioned(
          top: Dimensions.PopularImgSize - 20.0,
          left: 0,
          right: 0,
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
              children: [BigText(text: 'Popular Junk Food')],
            ),
          ),
        )
        // Container(
        //   width: double.maxFinite,
        //   height: 350,
        //   decoration: BoxDecoration(color: Colors.black),
        // )
      ]),
    );
  }
}
