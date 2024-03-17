import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.text = '',
    this.fontSize = 18,
    this.fontWeight,
    this.color = Colors.black,
    this.alignment = Alignment.center,
    this.decoration,
    this.maxLines,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color color;
  final AlignmentGeometry alignment;
  final TextDecoration? decoration;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: decoration,
          color: color,
        ),
      ),
    );
  }
}
