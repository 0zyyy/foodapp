import 'package:flutter/material.dart';
import 'package:foodapp/utils/dimension.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow textOverflow;
  const BigText(
      {Key? key,
      this.color = const Color(0xFF8f837f),
      this.size = 0.0,
      required this.text,
      this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size == 0 ? Dimensions.font20 : size,
        fontFamily: 'Roboto',
        color: color,
        fontWeight: FontWeight.bold,
      ),
      overflow: textOverflow,
    );
  }
}
