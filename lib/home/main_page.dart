import 'package:flutter/material.dart';
import 'package:foodapp/pages/home/body_page.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/big_text.dart';
import 'package:foodapp/widgets/small_text.dart';
//IMPORT widget

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                        text: 'Adalah Gw',
                        size: 20,
                        color: AppColors.mainColor),
                    Row(
                      children: [
                        SmallText(
                          text: 'Anda Banget ',
                        ),
                        Icon(Icons.arrow_drop_down_rounded),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.iconSize24,
                      )),
                )
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: BodyPage(),
          )),
        ],
      ),
    );
  }
}
