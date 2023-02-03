import 'package:flutter/material.dart';
import 'common_text.dart';

class CommonAddButton extends StatelessWidget {
  final dynamic onTap;
  final String text;

  const CommonAddButton({Key? key, this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 90.0,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [Color(0xff0160A5), Color(0xff11A7FC)],
            ),
            border: Border.all(width: 2.0, color: const Color(0xff11A8FD)),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xff1F2427).withOpacity(0.8),
                  // color: Colors.red.withOpacity(0.8),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(4, 4)),
              BoxShadow(
                  color: const Color(0xff484E53).withOpacity(0.6),
                  // color: Colors.yellow.withOpacity(0.6),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(-2, -4)),
            ],
            borderRadius: BorderRadius.circular(30.0)),
        height: 50.0,
        child: Center(
          child: CommonText(
              text: text,
              size: 16.0,
              weight: FontWeight.w500,
              color: Colors.white),
        ),
      ),
    );
  }
}
