import 'package:flutter/material.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';

class CommonButton extends StatelessWidget {
  final dynamic text;
  final dynamic onTap;

  const CommonButton({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: const Color(0xff000000).withOpacity(0.5),
                // color: Colors.red.withOpacity(0.8),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, 0)),
          ],
          border: Border.all(width: 2.0, color: const Color(0xff11A8FD)),
          borderRadius: BorderRadius.circular(15.0),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff0160A5), Color(0xff11A7FC)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.0),
            child: CommonText(
                text: text,
                size: 16.0,
                weight: FontWeight.w700,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
