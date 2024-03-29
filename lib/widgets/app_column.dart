import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/big_text.dart';
import 'package:foodapp/widgets/icon_and_text.dart';
import 'package:foodapp/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
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
    );
  }
}
