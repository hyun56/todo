import 'package:flutter/material.dart';
import 'package:todo/common/theme/colors.dart';

class Line extends StatelessWidget {
  const Line({
    Key? key,
    this.color,
    this.height = 1,
    this.margin,
  }) : super(key: key);

  final Color? color;
  final EdgeInsets? margin;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      color: color ?? grey,
      height: height,
    );
  }
}
