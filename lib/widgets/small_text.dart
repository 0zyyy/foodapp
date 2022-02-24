import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;
  const SmallText({
    Key? key,
    this.height = 1.2,
    this.color = const Color(0xFF8E8E93),
    this.size = 12.0,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        height: height,
        fontFamily: 'Roboto',
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
