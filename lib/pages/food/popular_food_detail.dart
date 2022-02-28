import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/app_column.dart';
import 'package:foodapp/widgets/app_icon.dart';
import 'package:foodapp/widgets/big_text.dart';
import 'package:foodapp/widgets/expandable_text.dart';
import 'package:foodapp/widgets/small_text.dart';

class PopularFoodPageDetail extends StatelessWidget {
  const PopularFoodPageDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                AppColumn(text: 'Rendang Balado'),
                SizedBox(height: Dimensions.height20),
                BigText(text: 'Kenalan Dong Bund'),
                SizedBox(height: Dimensions.height10),
                Expanded(
                  child: SingleChildScrollView(
                    child: ExpandableText(
                        text:
                            'Makanan ini sangat enak dan bisa dikonsumsi sehari-hari. Makanan ini sangat enak dan bisa dikonsumsi sehari-hari. Makanan ini sangat enak dan bisa dikonsumsi sehari-hari. Makanan ini sangat enak dan bisa dikonsumsi sehari-hari. Makanan ini sangat enak dan bisa dikonsumsi sehari-hari. Makanan ini sangat enak dan bisa dikonsumsi sehari-hari. Makanan ini sangat enak dan bisa dikonsumsi sehari-hari.'),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
      bottomNavigationBar: Container(
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
                    Icon(
                      Icons.remove,
                      color: AppColors.signColor,
                    ),
                    SizedBox(width: Dimensions.width10 / 2),
                    BigText(text: '0'),
                    SizedBox(width: Dimensions.width10 / 2),
                    Icon(
                      Icons.add,
                      color: AppColors.signColor,
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
              child: BigText(
                text: 'Add to Cart',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
