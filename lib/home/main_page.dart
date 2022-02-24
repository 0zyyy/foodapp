import 'package:flutter/material.dart';
import 'package:foodapp/home/body_page.dart';
import 'package:foodapp/utils/colors.dart';
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
            margin: const EdgeInsets.only(top: 45, bottom: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
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
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.mainColor),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
                )
              ],
            ),
          ),
          BodyPage(),
        ],
      ),
    );
  }
}
