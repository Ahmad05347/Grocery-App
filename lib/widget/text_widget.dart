import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  TextWidget(
      {super.key,
      required this.color,
      this.isTitle = false,
      required this.text,
      required this.textSize,
      this.maxLines = 10});

  final String text;
  final Color color;
  final double textSize;
  bool isTitle;
  int maxLines = 10;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: color,
          fontSize: textSize,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal),
    );
  }
}
