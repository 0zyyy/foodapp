import 'package:flutter/material.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color IconColor;
  const IconAndText({
    Key? key,
    required this.icon,
    required this.text,
    required this.IconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: IconColor,
          size: Dimensions.iconSize24,
        ),
        SizedBox(
          width: 10,
        ),
        SmallText(text: text),
      ],
    );
  }
}
