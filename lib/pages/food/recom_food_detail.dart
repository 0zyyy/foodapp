import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/app_icon.dart';
import 'package:foodapp/widgets/big_text.dart';
import 'package:foodapp/widgets/expandable_text.dart';

class RecomDetail extends StatelessWidget {
  const RecomDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.close_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20))),
                child: Center(
                    child: BigText(
                  size: Dimensions.font26,
                  text: 'BAEKOK BUNDA MASZ',
                )),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
              'assets/image/food1.png',
              width: double.maxFinite,
              fit: BoxFit.cover,
            )),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableText(
                      text:
                          'BAKEKOK BUNDA MAS BAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MASBAKEKOK BUNDA MAS'),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcon(
                icon: Icons.remove,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.iconSize24,
              ),
              SizedBox(
                width: Dimensions.width20,
              ),
              BigText(text: "\$ 12.88" + " X " + "0"),
              SizedBox(
                width: Dimensions.width20,
              ),
              AppIcon(
                icon: Icons.add,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.iconSize24,
              ),
            ],
          ),
          Container(
            height: Dimensions.NavbarHeight,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
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
                Icon(
                  Icons.favorite,
                  size: Dimensions.iconSize24,
                  color: AppColors.mainColor,
                ),
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
                    text: 'X28.1 Tambah',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
