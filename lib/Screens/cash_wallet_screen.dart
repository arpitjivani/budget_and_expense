import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_add_button.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_appbar.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_container.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_scaffold.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Screens/ADD_Category_Dialog.dart';
import 'package:spendee_budget_and_expense/Screens/edit_cash_wallet_screen.dart';
import 'package:spendee_budget_and_expense/Screens/edit_categories.dart';
import 'package:spendee_budget_and_expense/Screens/edit_wallet_screen.dart';
import 'package:spendee_budget_and_expense/Screens/overview_screen.dart';
import 'package:spendee_budget_and_expense/Screens/wallet_overview_screen.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

class CashWallet extends StatefulWidget {
  final Function data;
  final Function data2;

  const CashWallet({Key? key, required this.data, required this.data2})
      : super(key: key);

  @override
  _CashWalletState createState() => _CashWalletState();
}

class _CashWalletState extends State<CashWallet> {
  late Query _reference;
  num totalAmount = 0;
  num totalExpenseAmount = 0;
  num chartExpenseAmount = 0;
  num chartIncomeAmount = 0;

  String? getUId;

  void getEmailToStorage() async {
    getUId = await getStringFromLocalStorage(KEY_USER_UID);
    print("-8-8-8-8-${getUId}");
    _reference = FirebaseDatabase.instance
        .ref()
        .child("UserData")
        .child("$getUId")
    .child("Wallet")
        .child("IncomeExpenseData");
    print("====++++$_reference");
    calculateTotal();
    chartExpenseTotal();
    chartIncomeTotal();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getEmailToStorage();
    setState(() {});
  }

  calculateTotal() {
    totalAmount = 0;
    _reference.get().asStream().forEach((event) {
      event.children.forEach((element) {
        var childVal = element.value as Map;

        print((element.value as Map));
        if ((element.value as Map)["categoryName"] == "Expense") {
          totalAmount -= num.parse(childVal["amount"].toString());
        } else {
          totalAmount += num.parse(childVal["amount"].toString());
        }
      });
    });
    setState(() {});
  }

  chartExpenseTotal() {
    chartExpenseAmount = 0;
    _reference.get().asStream().forEach((event) {
      event.children.forEach((element) {
        var childVal = element.value as Map;

        print((element.value as Map));
        if ((element.value as Map)["categoryName"] == "Expense") {
          chartExpenseAmount += num.parse(childVal["amount"].toString());
        } else {
          // chartExpenseAmount += num.parse(childVal["amount"].toString());
        }
      });
    });
    setState(() {});
  }

  chartIncomeTotal() {
    chartIncomeAmount = 0;
    _reference.get().asStream().forEach((event) {
      event.children.forEach((element) {
        var childVal = element.value as Map;

        print((element.value as Map));
        if ((element.value as Map)["categoryName"] == "Income") {
          chartIncomeAmount += num.parse(childVal["amount"].toString());
        } else {
          // chartIncomeAmount += num.parse(childVal["amount"].toString());
        }
      });
    });
    setState(() {});
  }

  calculateExpense() {
    totalExpenseAmount = 0;
    _reference.get().asStream().forEach((event) {
      event.children.forEach((element) {
        var childVal = element.value as Map;

        print((element.value as Map));
        if ((element.value as Map)["categoryName"] == "Expense") {
          totalExpenseAmount -= num.parse(childVal["amount"].toString());
        }
      });
    });
    setState(() {});
  }

  List<PaintExpense> paintsExpense = <PaintExpense>[
    PaintExpense(
        1,
        'Food/Drink ',
        '0 Transaction in 0 Wallet',
        const Color(0xff016BB8),
        const Color(0xff11A8FD),
        "assets/Category_Icon/food.png"),
    PaintExpense(
        2,
        'Shopping ',
        '0 Transaction in 0 Wallet',
        const Color(0xffD3200C),
        const Color(0xffFF5510),
        "assets/Category_Icon/shopping.png"),
    PaintExpense(
        3,
        'Home ',
        '0 Transaction in 0 Wallet',
        const Color(0xffC21FEE),
        const Color(0xffF35EA0),
        "assets/Category_Icon/home.png"),
    PaintExpense(
        4,
        'Bills/Fees ',
        '0 Transaction in 0 Wallet',
        const Color(0xff1F9C53),
        const Color(0xff3EF190),
        "assets/Category_Icon/bill.png"),
    PaintExpense(
        5,
        'Entertainment ',
        '0 Transaction in 0 Wallet',
        const Color(0xffF06500),
        const Color(0xffFFA05C),
        "assets/Category_Icon/shopping.png"),
    PaintExpense(
        6,
        'Car ',
        '0 Transaction in 0 Wallet',
        const Color(0xff89216B),
        const Color(0xffDA4453),
        "assets/Category_Icon/car.png"),
    PaintExpense(
        7,
        'Travel ',
        '0 Transaction in 0 Wallet',
        const Color(0xffC21FEE),
        const Color(0xffF35EA0),
        "assets/Category_Icon/travel.png"),
    PaintExpense(
        8,
        'Family/Personal ',
        '0 Transaction in 0 Wallet',
        const Color(0xff1144FF),
        const Color(0xff11A8FD),
        "assets/Category_Icon/shopping.png"),
    PaintExpense(
        9,
        'Transport ',
        '0 Transaction in 0 Wallet',
        const Color(0xff016BB8),
        const Color(0xff11A8FD),
        "assets/Category_Icon/transport.png"),
    PaintExpense(
        10,
        'Healthcare ',
        '0 Transaction in 0 Wallet',
        const Color(0xffD3200C),
        const Color(0xffFF5510),
        "assets/Category_Icon/healthcare.png"),
    PaintExpense(
        11,
        'Education ',
        '0 Transaction in 0 Wallet',
        const Color(0xffC21FEE),
        const Color(0xffF35EA0),
        "assets/Category_Icon/education.png"),
    PaintExpense(
        12,
        'Groceries ',
        '0 Transaction in 0 Wallet',
        const Color(0xff1F9C53),
        const Color(0xff3EF190),
        "assets/Category_Icon/groceries.png"),
    PaintExpense(
        13,
        'Gift ',
        '0 Transaction in 0 Wallet',
        const Color(0xffF06500),
        const Color(0xffFFA05C),
        "assets/Category_Icon/gift.png"),
    PaintExpense(
        14,
        'Sport/Hobbies ',
        '0 Transaction in 0 Wallet',
        const Color(0xff89216B),
        const Color(0xffDA4453),
        "assets/Category_Icon/sports.png"),
    PaintExpense(
        15,
        'Beauty ',
        '0 Transaction in 0 Wallet',
        const Color(0xffC21FEE),
        const Color(0xffF35EA0),
        "assets/Category_Icon/beauty.png"),
    PaintExpense(
        16,
        'Work ',
        '0 Transaction in 0 Wallet',
        const Color(0xff1144FF),
        const Color(0xff11A8FD),
        "assets/Category_Icon/healthcare.png"),
    PaintExpense(
        17,
        'Other ',
        '0 Transaction in 0 Wallet',
        const Color(0xff016BB8),
        const Color(0xff11A8FD),
        "assets/Category_Icon/healthcare.png"),
  ];

  @override
  Widget build(BuildContext context) {
    print("------$totalAmount");
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
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        CommonAppBar(
                            text1: "Cash Wallet",
                            text2: "Transactions",
                            leftButtonIcon: "assets/left_arrow.png",
                            rightButtonIcon: "assets/edit.png",
                            clickLeft: () {
                              Navigator.of(context).pop();
                            },
                            clickRight: () {
                              // widget.data();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditWallet(),
                              ));
                            }),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            CommonContainer2(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CommonText(
                                              text:
                                                  "₹ ${totalAmount.toString()}",
                                              size: 20.0,
                                              weight: FontWeight.w700,
                                              color: blueColor),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          CommonText(
                                              text: "Wallet Balance",
                                              align: TextAlign.center,
                                              size: 14.0,
                                              weight: FontWeight.w500,
                                              color: Colors.white
                                                  .withOpacity(0.3)),
                                        ],
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       horizontal: 10.0),
                                    //   child: FDottedLine(
                                    //     color: Colors.white.withOpacity(0.5),
                                    //     height: 60,
                                    //   ),
                                    // ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CommonText(
                                              text:
                                                  "₹ ${totalExpenseAmount.toString()}",
                                              size: 20.0,
                                              weight: FontWeight.w700,
                                              color: redColor),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          CommonText(
                                              align: TextAlign.center,
                                              text: "Monthly Cash Flow",
                                              size: 14.0,
                                              weight: FontWeight.w500,
                                              color: Colors.white
                                                  .withOpacity(0.3)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OverviewScreen(
                                      data: chartExpenseAmount,
                                      data2: chartIncomeAmount),
                                ));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CommonText(
                                      text: "Wallet Overview",
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
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                        Expanded(
                          child: FirebaseAnimatedList(
                              reverse: false,
                              defaultChild: const Center(
                                  child: CircularProgressIndicator()),
                              physics: const AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              query: _reference,
                              itemBuilder: (BuildContext context,
                                  DataSnapshot snapshot,
                                  Animation<double> animation,
                                  int index) {
                                Map contact = snapshot.value as Map;
                                contact['key'] = snapshot.key;
                                return _addCategoryItem(category: contact);
                              }),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, right: 20.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CommonAddButton(
                        text: "ADD +",
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => Dialog(
                                    insetPadding: const EdgeInsets.all(25.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                    elevation: 0.0,
                                    backgroundColor: Colors.transparent,
                                    child: AddCategoryDialog(context,
                                        onSuccess: () {}),
                                  ));
                          calculateTotal();
                          calculateExpense();
                        },
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget _addCategoryItem({required Map category}) {
    return InkWell(
      onTap: () async {
        bool isBack = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => EditCategories(
                      categoryKey: category['key'],
                      categoryData: category,
                      uid: getUId,
                    )));
        print("isBack -> $isBack");
        if (isBack != null && isBack) {
          calculateTotal();
          calculateExpense();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: Container(
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/WalletPage/bg.png")),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [Color(0xff1C1F22), Color(0xff2C3036)],
              ),
              border: Border.all(
                  color: const Color(0xff000000).withOpacity(0.05), width: 2),
              boxShadow: [
                BoxShadow(
                    color: const Color(0xff1F2427).withOpacity(0.3),
                    // color: Colors.red.withOpacity(0.8),
                    blurRadius: 3,
                    spreadRadius: 0,
                    offset: const Offset(4, 4)),
                BoxShadow(
                    color: const Color(0xff484E53).withOpacity(0.2),
                    // color: Colors.yellow.withOpacity(0.6),
                    blurRadius: 3,
                    spreadRadius: 0,
                    offset: const Offset(-2, -4)),
              ],
              borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          gradient: category['categoryName'] == "Expense"
                              ? LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff11A8FD),
                                    Color(0xff0081C9),
                                  ],
                                )
                              : LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffFF935F),
                                    Color(0xffFE684D),
                                  ],
                                ),
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child:
                            Image.asset(category['icon'], color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                            text: category['mainCategory'],
                            size: 16.0,
                            weight: FontWeight.w500,
                            color: Colors.white),
                        const SizedBox(
                          height: 5.0,
                        ),
                        CommonText(
                            text: category['date'],
                            size: 13.0,
                            weight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.3)),
                        const SizedBox(
                          height: 5.0,
                        ),
                        if (category['image'] != null)
                          if (category['image'].toString().isNotEmpty)
                            Image.memory(
                              base64Decode(category['image']),
                              width: 50.0,
                              height: 50.0,
                            )
                      ],
                    ),
                  ],
                ),
              ),
              // widget.data.fold[0,priv+element.]
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: category['categoryName'] == "Expense"
                    ? CommonText(
                        text: "-${category['amount']}",
                        size: 18.0,
                        weight: FontWeight.w600,
                        color: redColor)
                    : CommonText(
                        text: category['amount'],
                        size: 18.0,
                        weight: FontWeight.w600,
                        color: greenColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Column(
// children: [
// Padding(
// padding: const EdgeInsets.all(10.0),
// child: InkWell(
// onTap: () {
// },
// child: CommonContainer2(
// child: Row(
// children: [
// Padding(
// padding: const EdgeInsets.only(
// left: 15.0,
// top: 10.0,
// bottom: 10.0,
// right: 10.0),
// child: Image.asset(
// "assets/WalletPage/wallet_3d.png",
// width: 45.0,
// ),
// ),
// Column(
// mainAxisAlignment:
// MainAxisAlignment.start,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// CommonText(
// text: "Cash Wallet",
// size: 14.0,
// weight: FontWeight.w500,
// color: Colors.white
//     .withOpacity(0.5)),
// const SizedBox(
// height: 5.0,
// ),
// const CommonText(
// text: "₹ 25,000",
// size: 16.0,
// weight: FontWeight.w700,
// color: Colors.white),
// ],
// ),
// ],
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(10.0),
// child: InkWell(
// onTap: () {
// },
// child: CommonContainer2(
// child: Row(
// children: [
// Padding(
// padding: const EdgeInsets.only(
// left: 15.0,
// top: 10.0,
// bottom: 10.0,
// right: 10.0),
// child: Image.asset(
// "assets/WalletPage/wallet_3d.png",
// width: 45.0,
// ),
// ),
// Column(
// mainAxisAlignment:
// MainAxisAlignment.start,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// CommonText(
// text: "Cash Wallet",
// size: 14.0,
// weight: FontWeight.w500,
// color: Colors.white
//     .withOpacity(0.5)),
// const SizedBox(
// height: 5.0,
// ),
// const CommonText(
// text: "₹ 25,000",
// size: 16.0,
// weight: FontWeight.w700,
// color: Colors.white),
// ],
// ),
// ],
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(10.0),
// child: InkWell(
// onTap: () {
// },
// child: CommonContainer2(
// child: Row(
// children: [
// Padding(
// padding: const EdgeInsets.only(
// left: 15.0,
// top: 10.0,
// bottom: 10.0,
// right: 10.0),
// child: Image.asset(
// "assets/WalletPage/wallet_3d.png",
// width: 45.0,
// ),
// ),
// Column(
// mainAxisAlignment:
// MainAxisAlignment.start,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// CommonText(
// text: "Cash Wallet",
// size: 14.0,
// weight: FontWeight.w500,
// color: Colors.white
//     .withOpacity(0.5)),
// const SizedBox(
// height: 5.0,
// ),
// const CommonText(
// text: "₹ 25,000",
// size: 16.0,
// weight: FontWeight.w700,
// color: Colors.white),
// ],
// ),
// ],
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(10.0),
// child: InkWell(
// onTap: () {
// },
// child: CommonContainer2(
// child: Row(
// children: [
// Padding(
// padding: const EdgeInsets.only(
// left: 15.0,
// top: 10.0,
// bottom: 10.0,
// right: 10.0),
// child: Image.asset(
// "assets/WalletPage/wallet_3d.png",
// width: 45.0,
// ),
// ),
// Column(
// mainAxisAlignment:
// MainAxisAlignment.start,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// CommonText(
// text: "Cash Wallet",
// size: 14.0,
// weight: FontWeight.w500,
// color: Colors.white
//     .withOpacity(0.5)),
// const SizedBox(
// height: 5.0,
// ),
// const CommonText(
// text: "₹ 25,000",
// size: 16.0,
// weight: FontWeight.w700,
// color: Colors.white),
// ],
// ),
// ],
// ),
// ),
// ),
// ),
// ],
// ),

class PaintExpense {
  final int id;
  final String title;
  final String title2;
  final Color colorpicture1;
  final Color colorpicture2;
  final String icon;
  bool selected = false;

  PaintExpense(this.id, this.title, this.title2, this.colorpicture1,
      this.colorpicture2, this.icon);
}

class PaintIncome {
  final int id;
  final String title;
  final String title2;
  final Color colorpicture1;
  final Color colorpicture2;
  final String icon;
  bool selected = false;

  PaintIncome(this.id, this.title, this.title2, this.colorpicture1,
      this.colorpicture2, this.icon);
}
