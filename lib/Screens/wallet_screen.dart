import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_container.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Screens/cash_wallet_screen.dart';
import 'package:spendee_budget_and_expense/Screens/chart.dart';
import 'package:spendee_budget_and_expense/Screens/create_new_cash_wallet.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

class WalletScreen extends StatefulWidget {
  final Function onNext;
  final Function onNext3;
  final Function dataDrawer;

  const WalletScreen(
      {Key? key,
      required this.onNext,
      required this.onNext3,
      required this.dataDrawer})
      : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  String? getUId;

  var snapshot;

  checkWallet() async {
    var dbRef = FirebaseDatabase.instance
        .ref()
        .child("UserData")
        .child("$getUId")
        .child("Wallet");
    snapshot = await dbRef.get();
    // Fluttertoast.showToast(msg: snapshot.value.toString());
    // Fluttertoast.showToast(msg: snapshot.value.toString());
    print("###########${snapshot.value.toString()}");
    setState(() {});
  }

  void getEmailToStorage() async {
    getUId = await getStringFromLocalStorage(KEY_USER_UID);
    checkWallet();
    setState(() {});
  }

  @override
  void initState() {
    getEmailToStorage();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: mainBG1,
        child: SafeArea(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100.0,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CommonText(
                                    text: "Your Cash Flow",
                                    size: 16.0,
                                    weight: FontWeight.w500,
                                    color: Colors.white),
                                SizedBox(
                                  height: 5.0,
                                ),
                                CommonText(
                                    text: "₹ 0",
                                    size: 18.0,
                                    weight: FontWeight.w700,
                                    color: Colors.white),
                              ],
                            ),
                            InkWell(
                              onTap: () {},
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
                                        "assets/HomePage/search.png",
                                        color: const Color(0xff7F8489)),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Fluttertoast.showToast(
                                              msg: "All Wallets");
                                        },
                                        child: Container(
                                          width: 110.0,
                                          decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomLeft,
                                                colors: [
                                                  Color(0xff2F353A),
                                                  Color(0xff1C1F22)
                                                ],
                                              ),
                                              border: Border.all(
                                                width: 2.0,
                                                color: const Color(0xff000000)
                                                    .withOpacity(0.05),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color:
                                                        const Color(0xff1F2427)
                                                            .withOpacity(0.8),
                                                    // color: Colors.red.withOpacity(0.8),
                                                    blurRadius: 10,
                                                    spreadRadius: 0,
                                                    offset: const Offset(4, 4)),
                                                BoxShadow(
                                                    color:
                                                        const Color(0xff484E53)
                                                            .withOpacity(0.6),
                                                    // color: Colors.yellow.withOpacity(0.6),
                                                    blurRadius: 10,
                                                    spreadRadius: 0,
                                                    offset:
                                                        const Offset(-2, -4)),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          height: 40.0,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CommonText(
                                                    text: "All Wallets",
                                                    size: 14.0,
                                                    weight: FontWeight.w500,
                                                    color: Colors.white
                                                        .withOpacity(0.5)),
                                                const SizedBox(
                                                  width: 3.0,
                                                ),
                                                Image.asset(
                                                  "assets/HomePage/down_arrow.png",
                                                  width: 15.0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Fluttertoast.showToast(
                                              msg: "By Month");
                                        },
                                        child: Container(
                                          width: 110.0,
                                          decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomLeft,
                                                colors: [
                                                  Color(0xff2F353A),
                                                  Color(0xff1C1F22)
                                                ],
                                              ),
                                              border: Border.all(
                                                width: 3.0,
                                                color: const Color(0xff000000)
                                                    .withOpacity(0.05),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color:
                                                        const Color(0xff1F2427)
                                                            .withOpacity(0.8),
                                                    // color: Colors.red.withOpacity(0.8),
                                                    blurRadius: 10,
                                                    spreadRadius: 0,
                                                    offset: const Offset(4, 4)),
                                                BoxShadow(
                                                    color:
                                                        const Color(0xff484E53)
                                                            .withOpacity(0.6),
                                                    // color: Colors.yellow.withOpacity(0.6),
                                                    blurRadius: 10,
                                                    spreadRadius: 0,
                                                    offset:
                                                        const Offset(-2, -4)),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          height: 40.0,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CommonText(
                                                    text: "By Month",
                                                    size: 14.0,
                                                    weight: FontWeight.w500,
                                                    color: Colors.white
                                                        .withOpacity(0.5)),
                                                const SizedBox(
                                                  width: 3.0,
                                                ),
                                                Image.asset(
                                                  "assets/HomePage/down_arrow.png",
                                                  width: 15.0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  CommonContainer(
                                    height: 170.0,
                                    padding: const EdgeInsets.all(5.0),
                                    child: BarChartWithSecondaryAxis
                                        .withSampleData(
                                      data: null,
                                      data2: null,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CommonText(
                                          text: "Spending Overview",
                                          size: 12.0,
                                          weight: FontWeight.w500,
                                          color: Colors.white.withOpacity(0.5)),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Image.asset("assets/HomePage/arrow.png",
                                          width: 18.0),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              snapshot!=null ? snapshot.exists
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CashWallet(
                                                        data: widget.onNext,
                                                        data2:
                                                            widget.onNext3)));
                                      },
                                      child: CommonContainer2(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0,
                                                  top: 10.0,
                                                  bottom: 10.0,
                                                  right: 10.0),
                                              child: Image.asset(
                                                "assets/WalletPage/wallet_3d.png",
                                                width: 60.0,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                    text: "Cash Wallet",
                                                    size: 16.0,
                                                    weight: FontWeight.w500,
                                                    color: Colors.white
                                                        .withOpacity(0.5)),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                const CommonText(
                                                    text: "₹ 25,000",
                                                    size: 18.0,
                                                    weight: FontWeight.w700,
                                                    color: Colors.white),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              CreateNewCashWallet(),
                                        ));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: const Color(0xff000000)
                                                    .withOpacity(0.5),
                                                // color: Colors.red.withOpacity(0.8),
                                                blurRadius: 10,
                                                spreadRadius: 0,
                                                offset: const Offset(0, 0)),
                                          ],
                                          border: Border.all(
                                              width: 2.0,
                                              color: const Color(0xff11A8FD)),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xff0160A5),
                                              Color(0xff11A7FC)
                                            ],
                                          ),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 13.0),
                                            child: CommonText(
                                                text: "Create a Cash Wallet",
                                                size: 16.0,
                                                weight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ):InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) =>
                                        CreateNewCashWallet(),
                                  ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0xff000000)
                                              .withOpacity(0.5),
                                          // color: Colors.red.withOpacity(0.8),
                                          blurRadius: 10,
                                          spreadRadius: 0,
                                          offset: const Offset(0, 0)),
                                    ],
                                    border: Border.all(
                                        width: 2.0,
                                        color: const Color(0xff11A8FD)),
                                    borderRadius:
                                    BorderRadius.circular(15.0),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xff0160A5),
                                        Color(0xff11A7FC)
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 13.0),
                                      child: CommonText(
                                          text: "Create a Cash Wallet",
                                          size: 16.0,
                                          weight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              // InkWell(
                              //   onTap: () {
                              //     Fluttertoast.showToast(
                              //         msg: "Create New Wallet");
                              //   },
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Image.asset(
                              //         "assets/WalletPage/wallet.png",
                              //         width: 25.0,
                              //       ),
                              //       const SizedBox(
                              //         width: 5.0,
                              //       ),
                              //       CommonText(
                              //           text: "Create New Wallet",
                              //           size: 16.0,
                              //           weight: FontWeight.w500,
                              //           color: Colors.white.withOpacity(0.5)),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
