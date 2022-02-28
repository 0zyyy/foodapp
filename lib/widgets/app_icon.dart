import 'package:flutter/material.dart';
import 'package:foodapp/utils/dimension.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final double iconSize;
  const AppIcon(
      {Key? key,
      required this.icon,
      this.size = 40,
      this.backgroundColor = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xFF756d54),
      this.iconSize = 16,
      Color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(size / 2)),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
