import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final dynamic maxLine;
  final dynamic align;
  final dynamic overflow;

  const CommonText(
      {Key? key,
      required this.text,
      required this.size,
      required this.weight,
      required this.color,
      this.maxLine,
      this.overflow,
      this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: "SpaceFont",
        fontWeight: weight,
        color: color,
      ),
      maxLines: maxLine,
      overflow: overflow,
      textAlign: align,
    );
  }
}
