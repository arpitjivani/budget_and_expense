import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_button.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_scaffold.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';

class BudgetScreen extends StatefulWidget {
  final Function dataDrawer;
  final Function onNext;
  final Function onNext2;

  const BudgetScreen(
      {Key? key,
      required this.dataDrawer,
      required this.onNext,
      required this.onNext2})
      : super(key: key);

  @override
  _BudgetScreenState createState() => _BudgetScreenState();
}



class _BudgetScreenState extends State<BudgetScreen> {
  @override
  Widget build(BuildContext context) {
    int totalAmount = 25000;
    double remainAmount = 18489;

    var completeAmount = totalAmount - remainAmount;

    var getPercentage = completeAmount * 100 / totalAmount;

    var getBarPercentage = getPercentage / 100;

    return CommonScaffold(
      body: SafeArea(
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  mainBG1,
                  mainBG2,
                ],
              )),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 30.0,
                              ),
                              InkWell(
                                onTap: () {
                                  widget.onNext2();
                                },
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: AlignmentDirectional.topStart,
                                  fit: StackFit.loose,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              Color(0xff2F353A),
                                              Color(0xff1C1F22)
                                            ],
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: const Color(0xff1F2427)
                                                    .withOpacity(0.4),
                                                // color: Colors.red.withOpacity(0.8),
                                                blurRadius: 5,
                                                spreadRadius: 0,
                                                offset: const Offset(4, 4)),
                                            BoxShadow(
                                                color: const Color(0xff484E53)
                                                    .withOpacity(0.3),
                                                // color: Colors.yellow.withOpacity(0.6),
                                                blurRadius: 5,
                                                spreadRadius: 0,
                                                offset: const Offset(-2, -4)),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 50.0,
                                            bottom: 20.0,
                                            left: 10.0,
                                            right: 10.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0,
                                                  bottom: 20.0,
                                                  left: 10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      CommonText(
                                                          text: "18,489",
                                                          size: 18.0,
                                                          weight:
                                                              FontWeight.w500,
                                                          color: redColor),
                                                      CommonText(
                                                          text: "/",
                                                          size: 18.0,
                                                          weight:
                                                              FontWeight.w500,
                                                          color: Colors.white),
                                                      CommonText(
                                                          text: "25,000",
                                                          size: 18.0,
                                                          weight:
                                                              FontWeight.w500,
                                                          color: blueColor),
                                                    ],
                                                  ),
                                                  CommonText(
                                                      text: "15 Mar, 2022",
                                                      size: 12.0,
                                                      weight: FontWeight.w500,
                                                      color: Colors.white
                                                          .withOpacity(0.3))
                                                ],
                                              ),
                                            ),
                                            LinearPercentIndicator(
                                              backgroundColor: mainBG1,
                                              // width: MediaQuery.of(context).size.width,
                                              animation: true,
                                              lineHeight: 20.0,
                                              animationDuration: 1000,
                                              percent: getBarPercentage,
                                              animateFromLastPercent: true,
                                              center: CommonText(
                                                  text:
                                                      "${getPercentage.toStringAsFixed(2)}%",
                                                  size: 14.0,
                                                  weight: FontWeight.w500,
                                                  color: Colors.white),
                                              barRadius:
                                                  const Radius.elliptical(
                                                      5, 15),
                                              // linearStrokeCap: LinearStrokeCap.roundAll,
                                              progressColor: blueColor,
                                              maskFilter: const MaskFilter.blur(
                                                  BlurStyle.solid, 3),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: -22,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: const Color(0xff000000)
                                                      .withOpacity(0.05),
                                                  width: 2),
                                              gradient: const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xff2C3036),
                                                  Color(0xff1C1F22)
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              boxShadow: [
                                                BoxShadow(
                                                    color:
                                                        const Color(0xff1F2427)
                                                            .withOpacity(0.5),
                                                    // color: Colors.red.withOpacity(0.8),
                                                    blurRadius: 5,
                                                    spreadRadius: 0,
                                                    offset: const Offset(4, 4)),
                                                BoxShadow(
                                                    color:
                                                        const Color(0xff484E53)
                                                            .withOpacity(0.4),
                                                    // color: Colors.yellow.withOpacity(0.6),
                                                    blurRadius: 5,
                                                    spreadRadius: 0,
                                                    offset:
                                                        const Offset(-2, -4)),
                                              ],
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: CommonText(
                                                  text: "Monthly Expense",
                                                  size: 16.0,
                                                  weight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 50.0,
                              ),
                              const CommonText(
                                  text: "You have no budgets",
                                  size: 20.0,
                                  weight: FontWeight.w500,
                                  color: Colors.white),
                              const SizedBox(
                                height: 15.0,
                              ),
                              CommonText(
                                  align: TextAlign.center,
                                  text:
                                      "Start Saving Money by creating budgets and we will help you stick to it.",
                                  size: 14.0,
                                  weight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.5)),
                              const SizedBox(
                                height: 50.0,
                              ),
                              CommonButton(
                                  text: "Create Your First Budget",
                                  onTap: () {
                                    widget.onNext();
                                  }),
                              const SizedBox(
                                height: 20.0,
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),

                              const SizedBox(
                                height: 20.0,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
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
                            onTap: () {
                              widget.dataDrawer();
                            },
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
                                      width: 2.0,
                                      color: Colors.black.withOpacity(0.05)),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff353A40),
                                      Color(0xff16171B)
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                      "assets/HomePage/drawer.png",
                                      color: const Color(0xff7F8489)),
                                )),
                          ),
                          const CommonText(
                              text: "Budget",
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
                  )
                ],
              )),
        ),
      ),
    );
  }
}
