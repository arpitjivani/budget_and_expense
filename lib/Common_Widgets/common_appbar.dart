import 'package:flutter/material.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';

class CommonAppBar extends StatelessWidget {
  final dynamic clickLeft;
  final dynamic clickRight;
  final String text1;
  final String text2;
  final String leftButtonIcon;
  final String rightButtonIcon;

  const CommonAppBar(
      {Key? key,
      this.clickLeft,
      this.clickRight,
      required this.text1,
      required this.text2,
      required this.leftButtonIcon,
      required this.rightButtonIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: clickLeft,
            child: Container(
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 5.0,
                    ),
                  ],
                  border: Border.all(
                      width: 2.0, color: Colors.black.withOpacity(0.05)),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff353A40), Color(0xff16171B)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(leftButtonIcon,
                      color: const Color(0xff7F8489)),
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                  text: text1,
                  size: 18.0,
                  weight: FontWeight.w500,
                  color: Colors.white),
              const SizedBox(
                height: 5.0,
              ),
              CommonText(
                  text: text2,
                  size: 16.0,
                  weight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.3)),
            ],
          ),
          InkWell(
            onTap: clickRight,
            child: Container(
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 5.0,
                    ),
                  ],
                  border: Border.all(
                      width: 2.0, color: Colors.black.withOpacity(0.05)),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff353A40), Color(0xff16171B)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(rightButtonIcon,
                      color: const Color(0xff7F8489)),
                )),
          ),
        ],
      ),
    );
  }
}

class CommonAppBarOnlyLeftArrow extends StatelessWidget {
  final String text;
  final dynamic onTap;

  const CommonAppBarOnlyLeftArrow({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100.0,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5.0,
                      ),
                    ],
                    border: Border.all(
                        width: 2.0, color: Colors.black.withOpacity(0.05)),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff353A40), Color(0xff16171B)],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset("assets/left_arrow.png",
                        color: const Color(0xff7F8489)),
                  )),
            ),
            CommonText(
                text: text,
                size: 18.0,
                weight: FontWeight.w500,
                color: Colors.white),
            InkWell(
              onTap: () {},
              child: const SizedBox(
                width: 45.0,
                height: 45.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
