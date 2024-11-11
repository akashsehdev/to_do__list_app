import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fSize;
  final FontWeight? fWeight;

  const TextWidget({
    super.key,
    this.color,
    this.fSize,
    this.fWeight,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: fSize,
        fontWeight: fWeight,
      ),
    );
  }
}
