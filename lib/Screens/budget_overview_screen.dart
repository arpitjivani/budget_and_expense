import 'package:flutter/material.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_appbar.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_scaffold.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Demo/Pie_Chart/samples/pie_chart_sample2.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';

class BudgetOverviewScreen extends StatefulWidget {
  const BudgetOverviewScreen({Key? key}) : super(key: key);

  @override
  _BudgetOverviewScreenState createState() => _BudgetOverviewScreenState();
}

class _BudgetOverviewScreenState extends State<BudgetOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CommonText(
                          text: "Categories",
                          size: 20.0,
                          weight: FontWeight.w500,
                          color: Colors.white),
                      const PieChartSample2(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const CommonText(
                          text: "Wallet",
                          size: 20.0,
                          weight: FontWeight.w500,
                          color: Colors.white),
                      const PieChartSample2(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/WalletPage/bg.png")),
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
                                        .withOpacity(0.3),
                                    // color: Colors.red.withOpacity(0.8),
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                    offset: const Offset(4, 4)),
                                BoxShadow(
                                    color: const Color(0xff484E53)
                                        .withOpacity(0.2),
                                    // color: Colors.yellow.withOpacity(0.6),
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                    offset: const Offset(-2, -4)),
                              ],
                              borderRadius:
                              BorderRadius.circular(20.0)),
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2.0,
                                              color: const Color(
                                                  0xff11A8FD)),
                                          gradient:
                                          const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xff0160A5),
                                              Color(0xff11A7FC)
                                            ],
                                          ),
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.all(12.0),
                                        child: Image.asset(
                                            "assets/WalletPage/wallet.png",
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const CommonText(
                                            text: "Food/drink",
                                            size: 16.0,
                                            weight: FontWeight.w500,
                                            color: Colors.white),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        CommonText(
                                            text: "Cash Wallet",
                                            size: 13.0,
                                            weight: FontWeight.w500,
                                            color: Colors.white
                                                .withOpacity(0.3))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: CommonText(
                                    text: "-3,201",
                                    size: 18.0,
                                    weight: FontWeight.w600,
                                    color: redColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/WalletPage/bg.png")),
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
                                        .withOpacity(0.3),
                                    // color: Colors.red.withOpacity(0.8),
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                    offset: const Offset(4, 4)),
                                BoxShadow(
                                    color: const Color(0xff484E53)
                                        .withOpacity(0.2),
                                    // color: Colors.yellow.withOpacity(0.6),
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                    offset: const Offset(-2, -4)),
                              ],
                              borderRadius:
                              BorderRadius.circular(20.0)),
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2.0,
                                              color: const Color(
                                                  0xff11A8FD)),
                                          gradient:
                                          const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xff0160A5),
                                              Color(0xff11A7FC)
                                            ],
                                          ),
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.all(12.0),
                                        child: Image.asset(
                                            "assets/WalletPage/wallet.png",
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const CommonText(
                                            text: "Food/drink",
                                            size: 16.0,
                                            weight: FontWeight.w500,
                                            color: Colors.white),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        CommonText(
                                            text: "Cash Wallet",
                                            size: 13.0,
                                            weight: FontWeight.w500,
                                            color: Colors.white
                                                .withOpacity(0.3))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: CommonText(
                                    text: "-3,201",
                                    size: 18.0,
                                    weight: FontWeight.w600,
                                    color: redColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/WalletPage/bg.png")),
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
                                        .withOpacity(0.3),
                                    // color: Colors.red.withOpacity(0.8),
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                    offset: const Offset(4, 4)),
                                BoxShadow(
                                    color: const Color(0xff484E53)
                                        .withOpacity(0.2),
                                    // color: Colors.yellow.withOpacity(0.6),
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                    offset: const Offset(-2, -4)),
                              ],
                              borderRadius:
                              BorderRadius.circular(20.0)),
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2.0,
                                              color: const Color(
                                                  0xff11A8FD)),
                                          gradient:
                                          const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xff0160A5),
                                              Color(0xff11A7FC)
                                            ],
                                          ),
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.all(12.0),
                                        child: Image.asset(
                                            "assets/WalletPage/wallet.png",
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const CommonText(
                                            text: "Food/drink",
                                            size: 16.0,
                                            weight: FontWeight.w500,
                                            color: Colors.white),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        CommonText(
                                            text: "Cash Wallet",
                                            size: 13.0,
                                            weight: FontWeight.w500,
                                            color: Colors.white
                                                .withOpacity(0.3))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: CommonText(
                                    text: "-3,201",
                                    size: 18.0,
                                    weight: FontWeight.w600,
                                    color: redColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/WalletPage/bg.png")),
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
                                        .withOpacity(0.3),
                                    // color: Colors.red.withOpacity(0.8),
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                    offset: const Offset(4, 4)),
                                BoxShadow(
                                    color: const Color(0xff484E53)
                                        .withOpacity(0.2),
                                    // color: Colors.yellow.withOpacity(0.6),
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                    offset: const Offset(-2, -4)),
                              ],
                              borderRadius:
                              BorderRadius.circular(20.0)),
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2.0,
                                              color: const Color(
                                                  0xff11A8FD)),
                                          gradient:
                                          const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xff0160A5),
                                              Color(0xff11A7FC)
                                            ],
                                          ),
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.all(12.0),
                                        child: Image.asset(
                                            "assets/WalletPage/wallet.png",
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const CommonText(
                                            text: "Food/drink",
                                            size: 16.0,
                                            weight: FontWeight.w500,
                                            color: Colors.white),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        CommonText(
                                            text: "Cash Wallet",
                                            size: 13.0,
                                            weight: FontWeight.w500,
                                            color: Colors.white
                                                .withOpacity(0.3))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: CommonText(
                                    text: "-3,201",
                                    size: 18.0,
                                    weight: FontWeight.w600,
                                    color: redColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/WalletPage/bg.png")),
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
                                        .withOpacity(0.3),
                                    // color: Colors.red.withOpacity(0.8),
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                    offset: const Offset(4, 4)),
                                BoxShadow(
                                    color: const Color(0xff484E53)
                                        .withOpacity(0.2),
                                    // color: Colors.yellow.withOpacity(0.6),
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                    offset: const Offset(-2, -4)),
                              ],
                              borderRadius:
                              BorderRadius.circular(20.0)),
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2.0,
                                              color: const Color(
                                                  0xff11A8FD)),
                                          gradient:
                                          const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xff0160A5),
                                              Color(0xff11A7FC)
                                            ],
                                          ),
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.all(12.0),
                                        child: Image.asset(
                                            "assets/WalletPage/wallet.png",
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const CommonText(
                                            text: "Food/drink",
                                            size: 16.0,
                                            weight: FontWeight.w500,
                                            color: Colors.white),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        CommonText(
                                            text: "Cash Wallet",
                                            size: 13.0,
                                            weight: FontWeight.w500,
                                            color: Colors.white
                                                .withOpacity(0.3))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: CommonText(
                                    text: "-3,201",
                                    size: 18.0,
                                    weight: FontWeight.w600,
                                    color: redColor),
                              ),
                            ],
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
                  clickRight: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
