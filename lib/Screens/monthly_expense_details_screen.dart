import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_appbar.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_scaffold.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Screens/budget_overview_screen.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';

class MonthlyExpenseDetailsScreen extends StatefulWidget {
  const MonthlyExpenseDetailsScreen({Key? key}) : super(key: key);

  @override
  _MonthlyExpenseDetailsScreenState createState() =>
      _MonthlyExpenseDetailsScreenState();
}

class _MonthlyExpenseDetailsScreenState
    extends State<MonthlyExpenseDetailsScreen> {
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 90.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CommonText(
                                    text: "18,489",
                                    size: 20.0,
                                    weight: FontWeight.w500,
                                    color: redColor),
                                CommonText(
                                    text: "/",
                                    size: 20.0,
                                    weight: FontWeight.w500,
                                    color: Colors.white),
                                CommonText(
                                    text: "25,000",
                                    size: 20.0,
                                    weight: FontWeight.w500,
                                    color: blueColor),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Keep Spending. You can spend',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontFamily: "SpaceFont",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: ' ₹598.21 ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "SpaceFont",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0),
                                  ),
                                  TextSpan(
                                      text:
                                          'Each day for the rest of the period.'),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, bottom: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CommonText(
                                      text: "15 Mar, 2022",
                                      size: 12.0,
                                      weight: FontWeight.w500,
                                      color: Colors.white.withOpacity(0.3))
                                ],
                              ),
                            ),
                            LinearPercentIndicator(
                              backgroundColor: mainBG1,
                              width: MediaQuery.of(context).size.width - 50,
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 1000,
                              percent: getBarPercentage,
                              animateFromLastPercent: true,
                              center: CommonText(
                                  text: "${getPercentage.toStringAsFixed(2)}%",
                                  size: 14.0,
                                  weight: FontWeight.w500,
                                  color: Colors.white),
                              barRadius: const Radius.elliptical(5, 15),
                              // linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: blueColor,
                              maskFilter:
                                  const MaskFilter.blur(BlurStyle.solid, 3),
                            ),
                            const SizedBox(
                              height: 50.0,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const BudgetOverviewScreen(),
                                ));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1.7,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color(0xff1C1F22),
                                        Color(0xff2C3036)
                                      ],
                                    ),
                                    border: Border.all(
                                        color: const Color(0xff000000)
                                            .withOpacity(0.05),
                                        width: 2),
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0xff1F2427)
                                              .withOpacity(0.5),
                                          // color: Colors.red.withOpacity(0.8),
                                          blurRadius: 5,
                                          spreadRadius: 0,
                                          offset: const Offset(4, 4)),
                                      BoxShadow(
                                          color: const Color(0xff484E53)
                                              .withOpacity(0.4),
                                          // color: Colors.yellow.withOpacity(0.6),
                                          blurRadius: 5,
                                          spreadRadius: 0,
                                          offset: const Offset(-2, -4)),
                                    ],
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonText(
                                          text: "Budget Overview",
                                          size: 14.0,
                                          weight: FontWeight.w500,
                                          color: Colors.white.withOpacity(0.5)),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Image.asset(
                                        "assets/BudgetPage/next.png",
                                        width: 17.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CommonAppBar(
                      text1: "Cash Wallet",
                      text2: "Transactions",
                      leftButtonIcon: "assets/left_arrow.png",
                      rightButtonIcon: "assets/edit.png",
                      clickLeft: () {
                        Navigator.of(context).pop();
                      },
                      clickRight: () {},
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
