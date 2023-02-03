import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_add_button.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_scaffold.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Screens/ADD_Category_Dialog.dart';
import 'package:spendee_budget_and_expense/Screens/Drawer_Sub_Screens/add_category_expense_drawer_screen.dart';
import 'package:spendee_budget_and_expense/Screens/Drawer_Sub_Screens/add_category_income_drawer_screen.dart';
import 'package:spendee_budget_and_expense/Screens/Drawer_Sub_Screens/edit_expense_categories_drawer.dart';
import 'package:spendee_budget_and_expense/Screens/Drawer_Sub_Screens/edit_income_categories_drawer.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool selectingmode = false;
  bool isLoading = false;
  int _toggleValue = 0;
  late Query _reference;
  late Query _referenceIncome;

  List<Map<dynamic, PaintExpense>> paintsExpense = <Map<dynamic, PaintExpense>>[
    {
      "": PaintExpense(
          title: 'Food/Drink ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xff016BB8),
          colorPicture2: Color(0xff11A8FD),
          icon: "assets/Category_Icon/food.png")
    },
    {
      "": PaintExpense(
          title: 'Shopping ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xffD3200C),
          colorPicture2: Color(0xffFF5510),
          icon: "assets/Category_Icon/shopping.png")
    },
    {
      "": PaintExpense(
          title: 'Home ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xffC21FEE),
          colorPicture2: Color(0xffF35EA0),
          icon: "assets/Category_Icon/home.png"),
    },
    {
      "": PaintExpense(
          title: 'Bills/Fees ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xff1F9C53),
          colorPicture2: Color(0xff3EF190),
          icon: "assets/Category_Icon/bill.png"),
    },
    {
      "": PaintExpense(
          title: 'Entertainment ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xffF06500),
          colorPicture2: Color(0xffFFA05C),
          icon: "assets/Category_Icon/shopping.png"),
    },
    {
      "": PaintExpense(
          title: 'Car ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xff89216B),
          colorPicture2: Color(0xffDA4453),
          icon: "assets/Category_Icon/car.png"),
    },
    {
      "": PaintExpense(
          title: 'Travel ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xffC21FEE),
          colorPicture2: Color(0xffF35EA0),
          icon: "assets/Category_Icon/travel.png"),
    },
    {
      "": PaintExpense(
          title: 'Family/Personal ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xff1144FF),
          colorPicture2: Color(0xff11A8FD),
          icon: "assets/Category_Icon/shopping.png"),
    },
    {
      "": PaintExpense(
          title: 'Transport ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xff016BB8),
          colorPicture2: Color(0xff11A8FD),
          icon: "assets/Category_Icon/transport.png"),
    },
    {
      "": PaintExpense(
          title: 'Healthcare ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xffD3200C),
          colorPicture2: Color(0xffFF5510),
          icon: "assets/Category_Icon/healthcare.png"),
    },
    {
      "": PaintExpense(
          title: 'Education ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xffC21FEE),
          colorPicture2: Color(0xffF35EA0),
          icon: "assets/Category_Icon/education.png"),
    },
    {
      "": PaintExpense(
          title: 'Groceries ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xff1F9C53),
          colorPicture2: Color(0xff3EF190),
          icon: "assets/Category_Icon/groceries.png"),
    },
    {
      "": PaintExpense(
          title: 'Gift ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xffF06500),
          colorPicture2: Color(0xffFFA05C),
          icon: "assets/Category_Icon/gift.png"),
    },
    {
      "": PaintExpense(
          title: 'Sport/Hobbies ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xff89216B),
          colorPicture2: Color(0xffDA4453),
          icon: "assets/Category_Icon/sports.png"),
    },
    {
      "": PaintExpense(
          title: 'Beauty ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xffC21FEE),
          colorPicture2: Color(0xffF35EA0),
          icon: "assets/Category_Icon/beauty.png"),
    },
    {
      "": PaintExpense(
          title: 'Work ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xff1144FF),
          colorPicture2: Color(0xff11A8FD),
          icon: "assets/Category_Icon/healthcare.png"),
    },
    {
      "": PaintExpense(
          title: 'Other ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xff016BB8),
          colorPicture2: Color(0xff11A8FD),
          icon: "assets/Category_Icon/healthcare.png")
    }
  ];

  // void saveCategory() {
  //   String mainCategoryName = _categoryName.text;
  //   String image = _icon;
  //
  //   Map<String, String> contact = {
  //     'mainCategoryName': mainCategoryName,
  //     'image': image,
  //   };
  //
  //   _reference.push().set(contact).then((value) {
  //     Navigator.pop(context);
  //   });
  // }
  List<Map<dynamic, PaintIncome>> paintsIncome = <Map<dynamic, PaintIncome>>[
    {
      "": PaintIncome(
          title: 'Salary ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xff016BB8),
          colorPicture2: Color(0xff11A8FD),
          icon: "assets/Category_Icon/salary.png")
    },
    {
      "": PaintIncome(
          title: 'Business ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xffD3200C),
          colorPicture2: Color(0xffFF5510),
          icon: "assets/Category_Icon/work.png"),
    },
    {
      "": PaintIncome(
          title: 'Gifts ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xffC21FEE),
          colorPicture2: Color(0xffF35EA0),
          icon: "assets/Category_Icon/gift.png"),
    },
    {
      "": PaintIncome(
          title: 'Extra Income ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xff1F9C53),
          colorPicture2: Color(0xff3EF190),
          icon: "assets/Category_Icon/salary.png"),
    },
    {
      "": PaintIncome(
          title: 'Loan ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xffF06500),
          colorPicture2: Color(0xffFFA05C),
          icon: "assets/Category_Icon/loan.png"),
    },
    {
      "": PaintIncome(
          title: 'Parental Leave ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xff89216B),
          colorPicture2: Color(0xffDA4453),
          icon: "assets/Category_Icon/salary.png"),
    },
    {
      "": PaintIncome(
          title: 'Insurance Payout ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xffC21FEE),
          colorPicture2: Color(0xffF35EA0),
          icon: "assets/Category_Icon/salary.png"),
    },
    {
      "": PaintIncome(
          title: 'Other ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xff1144FF),
          colorPicture2: Color(0xff11A8FD),
          icon: "assets/Category_Icon/salary.png"),
    },
  ];

  late double xAlign;
  late Color loginColor;
  late Color signInColor;
  String? getUId;

  void getEmailToStorage() async {
    getUId = await getStringFromLocalStorage(KEY_USER_UID);
    _reference = FirebaseDatabase.instance
        .ref()
        .child("UserData")
        .child("$getUId")
        .child("AddNewCategoryExpense");
    _referenceIncome = FirebaseDatabase.instance
        .ref()
        .child("UserData")
        .child("$getUId")
        .child("AddNewCategoryIncome");
    getCategoryExpense();
    getCategoryIncome();
    setState(() {});
  }

  @override
  void initState() {
    getEmailToStorage();
    super.initState();
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
    _reference = FirebaseDatabase.instance
        .ref()
        .child("UserData")
        .child("$getUId")
        .child('AddNewCategoryExpense');
    _referenceIncome = FirebaseDatabase.instance
        .ref()
        .child("UserData")
        .child("$getUId")
        .child('AddNewCategoryIncome');
  }

  final List<PaintExpense> list = [];
  final List<PaintIncome> list2 = [];
  List<Map<dynamic, PaintExpense>> firebaseList = [];
  List<Map<dynamic, PaintIncome>> firebaseList2 = [];

  getCategoryExpense() async {
    print("getCategoryExpense -> ");

    var firebaseSnapshot = await FirebaseDatabase.instance
        .ref()
        .child("UserData")
        .child("$getUId")
        .child("AddNewCategoryExpense");

    firebaseSnapshot.onChildChanged.listen((event) {
      print("On value changed ${event.snapshot.key}");
      // firebaseList.add(values);
      firebaseList.forEach((Map element) {
        if (element.containsKey(event.snapshot.key)) {
          final user = PaintExpense.fromJson(Map<String, dynamic>.from(
              jsonDecode(jsonEncode(event.snapshot.value))));
          element.update(event.snapshot.key, (value) => user);
          if (mounted) setState(() {});
        }
      });
    });

    final snapshot = await FirebaseDatabase.instance
        .ref()
        .child("UserData")
        .child("$getUId")
        .child("AddNewCategoryExpense")
        .get();
    firebaseList.addAll(paintsExpense);
    if (snapshot.value != null) {
      // correct
      list.forEach((element) {
        print("ElementIncome -> ${element.title}");
      });
      Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;

      values.forEach((key, value) {
        print("ValutyeIncome -> ${value.runtimeType}");
        final user = PaintExpense.fromJson(Map<String, dynamic>.from(value));
        firebaseList.add({key: user});
        list.add(user);
        print("------>");
        print(list.length);
      });
    } else {
      // list2.addAll(paintsExpense);
      // list2.forEach((element) {
      //   print("Element -> ${element.title}");
      // });
    }
    setState(() {});
  }

  getCategoryIncome() async {
    print("getCategoryIncome -> ");

    var firebaseSnapshot = await FirebaseDatabase.instance
        .ref()
        .child("UserData")
        .child("$getUId")
        .child("AddNewCategoryIncome");

    firebaseSnapshot.onChildChanged.listen((event) {
      print("On value changed ${event.snapshot.key}");
      // firebaseList.add(values);
      firebaseList2.forEach((Map element) {
        if (element.containsKey(event.snapshot.key)) {
          final user = PaintIncome.fromJson(Map<String, dynamic>.from(
              jsonDecode(jsonEncode(event.snapshot.value))));
          element.update(event.snapshot.key, (value) => user);
          if (mounted) setState(() {});
        }
      });
    });

    final snapshot = await FirebaseDatabase.instance
        .ref()
        .child("UserData")
        .child("$getUId")
        .child("AddNewCategoryIncome")
        .get();
    firebaseList2.addAll(paintsIncome);
    if (snapshot.value != null) {
      // correct
      list2.forEach((element) {
        print("ElementIncome -> ${element.title}");
      });
      Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;

      values.forEach((key, value) {
        print("ValutyeIncome -> ${value.runtimeType}");
        final user = PaintIncome.fromJson(Map<String, dynamic>.from(value));
        firebaseList2.add({key: user});
        list2.add(user);
        print("------>");
        print(list2.length);
      });
    } else {
      // list2.addAll(paintsExpense);
      // list2.forEach((element) {
      //   print("Element -> ${element.title}");
      // });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // print(firebaseList);
    return CommonScaffold(
      body: SafeArea(
        child: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
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
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 160.0),
                          child: _toggleValue == 0
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: firebaseList.length,
                                  itemBuilder: (context, index) {
                                    var exp =
                                        firebaseList[index].values.toList()[0];
                                    // print(exp);
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 20.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/WalletPage/bg.png")),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                Color(0xff1C1F22),
                                                Color(0xff2C3036)
                                              ],
                                            ),
                                            border: Border.all(
                                                color: Color(0xff000000)
                                                    .withOpacity(0.05),
                                                width: 2),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color(0xff1F2427)
                                                      .withOpacity(0.3),
                                                  // color: Colors.red.withOpacity(0.8),
                                                  blurRadius: 3,
                                                  spreadRadius: 0,
                                                  offset: Offset(4, 4)),
                                              BoxShadow(
                                                  color: Color(0xff484E53)
                                                      .withOpacity(0.2),
                                                  // color: Colors.yellow.withOpacity(0.6),
                                                  blurRadius: 3,
                                                  spreadRadius: 0,
                                                  offset: Offset(-2, -4)),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        child: ListTile(
                                          tileColor: Colors.blueGrey,
                                          onLongPress: () {
                                            setState(() {
                                              selectingmode = true;
                                            });
                                          },
                                          onTap: () {
                                            setState(() {
                                              selectingmode
                                                  ? null
                                                  : Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditExpenseCategoriesDrawerScreen(
                                                              data: exp,
                                                              firebaseKey:
                                                                  firebaseList[
                                                                          index]
                                                                      .keys
                                                                      .toList()[0]),
                                                    ));
                                              if (selectingmode) {
                                                exp.selected = !exp.selected;
                                                log(exp.selected.toString());
                                              }
                                            });
                                          },
                                          selected: exp.selected,
                                          leading: GestureDetector(
                                            behavior: HitTestBehavior.opaque,
                                            onTap: () {
                                              // print(
                                              //     "Color1 => ${exp.colorPicture1}");
                                              // print(
                                              //     "Color2 => ${exp.colorPicture2}");
                                              print(
                                                  "Color => ${exp.colorPicture1}");
                                            },
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      // list[index].colorPicture1.toString() as Color,
                                                      // list[index].colorPicture1.toString() as Color,
                                                      // list[index].colorPicture1.toString() as dynamic,
                                                      // list[index].colorPicture2.toString() as dynamic,
                                                      // Color(int.parse('$opacity${exp.colorPicture1}', radix: 16)),
                                                      exp.colorPicture1!,
                                                      exp.colorPicture2!,
                                                      // Colors.yellow,
                                                    ],
                                                  ),
                                                  shape: BoxShape.circle),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Image.asset(
                                                    "${exp.icon}",
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          title: CommonText(
                                              text: "${exp.title}",
                                              size: 16.0,
                                              weight: FontWeight.w500,
                                              color: Colors.white),
                                          subtitle: CommonText(
                                              text: "${exp.icon}",
                                              size: 14.0,
                                              weight: FontWeight.w500,
                                              color: Colors.white
                                                  .withOpacity(0.5)),
                                          trailing: (selectingmode)
                                              ? ((exp.selected)
                                                  ? Icon(
                                                      Icons.check_box,
                                                      color: blueColor,
                                                    )
                                                  : Icon(
                                                      Icons
                                                          .check_box_outline_blank,
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                    ))
                                              : null,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: firebaseList2.length,
                                  itemBuilder: (context, index) {
                                    var exp2 =
                                        firebaseList2[index].values.toList()[0];
                                    // print(exp);
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 20.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/WalletPage/bg.png")),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                Color(0xff1C1F22),
                                                Color(0xff2C3036)
                                              ],
                                            ),
                                            border: Border.all(
                                                color: Color(0xff000000)
                                                    .withOpacity(0.05),
                                                width: 2),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color(0xff1F2427)
                                                      .withOpacity(0.3),
                                                  // color: Colors.red.withOpacity(0.8),
                                                  blurRadius: 3,
                                                  spreadRadius: 0,
                                                  offset: Offset(4, 4)),
                                              BoxShadow(
                                                  color: Color(0xff484E53)
                                                      .withOpacity(0.2),
                                                  // color: Colors.yellow.withOpacity(0.6),
                                                  blurRadius: 3,
                                                  spreadRadius: 0,
                                                  offset: Offset(-2, -4)),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        child: ListTile(
                                          tileColor: Colors.blueGrey,
                                          onLongPress: () {
                                            setState(() {
                                              selectingmode = true;
                                            });
                                          },
                                          onTap: () {
                                            setState(() {
                                              selectingmode
                                                  ? null
                                                  : Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditIncomeCategoriesDrawerScreen(
                                                              data2: exp2,
                                                              firebaseKey:
                                                                  firebaseList2[
                                                                          index]
                                                                      .keys
                                                                      .toList()[0]),
                                                    ));
                                              if (selectingmode) {
                                                exp2.selected = !exp2.selected;
                                                log(exp2.selected.toString());
                                              }
                                            });
                                          },
                                          selected: exp2.selected,
                                          leading: GestureDetector(
                                            behavior: HitTestBehavior.opaque,
                                            onTap: () {
                                              // print(
                                              //     "Color1 => ${exp.colorPicture1}");
                                              // print(
                                              //     "Color2 => ${exp.colorPicture2}");
                                              print(
                                                  "Color => ${exp2.colorPicture1}");
                                            },
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      // list[index].colorPicture1.toString() as Color,
                                                      // list[index].colorPicture1.toString() as Color,
                                                      // list[index].colorPicture1.toString() as dynamic,
                                                      // list[index].colorPicture2.toString() as dynamic,
                                                      // Color(int.parse('$opacity${exp.colorPicture1}', radix: 16)),
                                                      exp2.colorPicture1!,
                                                      exp2.colorPicture2!
                                                      // Colors.yellow,
                                                    ],
                                                  ),
                                                  shape: BoxShape.circle),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Image.asset(
                                                    "${exp2.icon}",
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          title: CommonText(
                                              text: "${exp2.title}",
                                              size: 16.0,
                                              weight: FontWeight.w500,
                                              color: Colors.white),
                                          subtitle: CommonText(
                                              text: "${exp2.icon}",
                                              size: 14.0,
                                              weight: FontWeight.w500,
                                              color: Colors.white
                                                  .withOpacity(0.5)),
                                          trailing: (selectingmode)
                                              ? ((exp2.selected)
                                                  ? Icon(
                                                      Icons.check_box,
                                                      color: blueColor,
                                                    )
                                                  : Icon(
                                                      Icons
                                                          .check_box_outline_blank,
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                    ))
                                              : null,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100.0,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      selectingmode
                                          ? setState(() {
                                              selectingmode = false;
                                              // paintsExpense.forEach(
                                              //     (p) => p.selected = false);
                                              // paintsIncome.forEach(
                                              //     (p) => p.selected = false);
                                            })
                                          : Navigator.of(context).pop();
                                    },
                                    child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                          border: Border.all(
                                              width: 2.0,
                                              color: Colors.black
                                                  .withOpacity(0.05)),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xff353A40),
                                              Color(0xff16171B)
                                            ],
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Image.asset(
                                              "assets/left_arrow.png",
                                              color: Color(0xff7F8489)),
                                        )),
                                  ),
                                  CommonText(
                                      text: "Categories",
                                      size: 18.0,
                                      weight: FontWeight.w500,
                                      color: Colors.white),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectingmode = true;
                                      });
                                    },
                                    child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                          border: Border.all(
                                              width: 2.0,
                                              color: Colors.black
                                                  .withOpacity(0.05)),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xff353A40),
                                              Color(0xff16171B)
                                            ],
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Image.asset(
                                              "assets/Drawer/merge.png",
                                              color: Color(0xff7F8489)),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: width,
                              height: height,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xff1C1F22),
                                      Color(0xff2C3036)
                                    ],
                                  ),
                                  border: Border.all(
                                      color:
                                          Color(0xff000000).withOpacity(0.05),
                                      width: 2),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color(0xff1F2427).withOpacity(0.5),
                                        // color: Colors.red.withOpacity(0.8),
                                        blurRadius: 5,
                                        spreadRadius: 0,
                                        offset: Offset(4, 4)),
                                    BoxShadow(
                                        color:
                                            Color(0xff484E53).withOpacity(0.4),
                                        // color: Colors.yellow.withOpacity(0.6),
                                        blurRadius: 5,
                                        spreadRadius: 0,
                                        offset: Offset(-2, -4)),
                                  ],
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Stack(
                                children: [
                                  AnimatedAlign(
                                    alignment: Alignment(xAlign, 0),
                                    duration: Duration(milliseconds: 300),
                                    child: Container(
                                      width: width * 0.5,
                                      height: height,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0xff000000)
                                                  .withOpacity(0.5),
                                              // color: Colors.red.withOpacity(0.8),
                                              blurRadius: 10,
                                              spreadRadius: 0,
                                              offset: Offset(0, 0)),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xff0160A5),
                                            Color(0xff11A7FC)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _toggleValue = 0;
                                        xAlign = loginAlign;
                                        loginColor = selectedColor;
                                        signInColor = normalColor;
                                      });
                                    },
                                    child: Align(
                                      alignment: const Alignment(-1, 0),
                                      child: Container(
                                          width: width * 0.5,
                                          color: Colors.transparent,
                                          alignment: Alignment.center,
                                          child: const CommonText(
                                              text: "Expense",
                                              size: 16.0,
                                              weight: FontWeight.w500,
                                              color: Colors.white)),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _toggleValue = 1;
                                        xAlign = signInAlign;
                                        signInColor = selectedColor;
                                        loginColor = normalColor;
                                      });
                                    },
                                    child: Align(
                                      alignment: const Alignment(1, 0),
                                      child: Container(
                                          width: width * 0.5,
                                          color: Colors.transparent,
                                          alignment: Alignment.center,
                                          child: const CommonText(
                                              text: "Income",
                                              size: 16.0,
                                              weight: FontWeight.w500,
                                              color: Colors.white)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0, right: 20.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CommonAddButton(
                        text: "ADD +",
                        onTap: () async {
                          if (_toggleValue == 0) {
                            bool isBack = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AddCategoriesExpenseDrawerScreen(),
                                ));
                            print("isBack -> $isBack");
                            if (isBack != null && isBack) {
                              setState(() {
                                _reference = FirebaseDatabase.instance
                                    .ref()
                                    .child("UserData")
                                    .child("$getUId")
                                    .child('AddNewCategoryExpense');
                                setState(() {});
                              });
                            }
                          } else {
                            bool isBack = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AddCategoriesIncomeDrawerScreen(),
                                ));
                            print("isBack -> $isBack");
                            if (isBack != null && isBack) {
                              setState(() {
                                _referenceIncome = FirebaseDatabase.instance
                                    .ref()
                                    .child("UserData")
                                    .child("$getUId")
                                    .child('AddNewCategoryIncome');
                                setState(() {});
                              });
                            }
                          }
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
}

// void setState(Null Function() param0) {
// }

// class PaintExpense {
//   final String? title;
//   final String? title2;
//   final String? firebaseKey;
//   final Color? colorPicture1;
//   final Color? colorPicture2;
//   final String? icon;
//   bool selected = false;
//
//   PaintExpense(
//       {this.title,
//       this.title2,
//       this.colorPicture1,
//       this.colorPicture2,
//       this.icon,
//       this.firebaseKey = ""});
//
//   factory PaintExpense.fromJson(Map<dynamic, dynamic> json) => PaintExpense(
//         title: json["mainCategoryName"] ?? "",
//         icon: json["image"] ?? "",
//         colorPicture1: Color(json["colorPicture1"]),
//         colorPicture2: Color(json["colorPicture2"]),
//       );
// }

class PaintExpense {
  final String? title;
  final String? title2;
  final String? firebaseKey;
  final Color? colorPicture1;
  final Color? colorPicture2;
  final String? icon;
  bool selected = false;

  PaintExpense(
      {this.title,
      this.title2,
      this.colorPicture1,
      this.colorPicture2,
      this.icon,
      this.firebaseKey = ""});

  factory PaintExpense.fromJson(Map<dynamic, dynamic> json) => PaintExpense(
        title: json["mainCategoryName"] ?? "",
        icon: json["image"] ?? "",
        colorPicture1: Color(json["colorPicture1"]),
        colorPicture2: Color(json["colorPicture2"]),
      );

  Map<String, dynamic> toJson() => {
        'mainCategoryName': title,
        'image': icon,
        'colorPicture1': colorPicture1,
        'colorPicture2': colorPicture2,
      };
}

// class PaintIncome {
//   final String? title;
//   final String? title2;
//   final String? firebaseKey;
//   final dynamic colorPicture1;
//   final dynamic colorPicture2;
//   final String? icon;
//   bool selected = false;
//
//   PaintIncome(
//       {this.title,
//       this.title2,
//       this.colorPicture1,
//       this.colorPicture2,
//       this.icon,
//       this.firebaseKey = ""});
//
//   factory PaintIncome.fromJson(Map<dynamic, dynamic> json) => PaintIncome(
//         title: json["mainCategoryName"] ?? "",
//         icon: json["image"] ?? "",
//         colorPicture1: json["color1"] ?? "",
//       );
// }

class PaintIncome {
  final String? title;
  final String? title2;
  final String? firebaseKey;
  final dynamic colorPicture1;
  final dynamic colorPicture2;
  final String? icon;
  bool selected = false;

  PaintIncome(
      {this.title,
      this.title2,
      this.colorPicture1,
      this.colorPicture2,
      this.icon,
      this.firebaseKey = ""});

  factory PaintIncome.fromJson(Map<dynamic, dynamic> json) => PaintIncome(
        title: json["mainCategoryName"] ?? "",
        icon: json["image"] ?? "",
        colorPicture1: Color(json["colorPicture1"]),
        colorPicture2: Color(json["colorPicture2"]),
      );

  Map<String, dynamic> toJson() => {
        'mainCategoryName': title,
        'image': icon,
        'colorPicture1': colorPicture1,
        'colorPicture2': colorPicture2,
      };
}

// class PaintIncome {
//   final String? title;
//   final String? title2;
//   final String? firebaseKey;
//   final dynamic colorPicture1;
//   final dynamic colorPicture2;
//   final String? icon;
//   bool selected = false;
//
//   PaintIncome({
//     this.title,
//     this.title2,
//     this.colorPicture1,
//     this.colorPicture2,
//     this.icon,
//     this.firebaseKey = ""
//   });
//
//   factory PaintIncome.fromJson(Map<dynamic, dynamic> json) => PaintIncome(
//         title: json["mainCategoryName"] ?? "",
//         icon: json["image"] ?? "",
//         colorPicture1: json["color1"] ?? "",
//       );
// }

// class PaintIncome {
//   final String? title;
//   final String? title2;
//   final Color? colorPicture1;
//   final Color? colorPicture2;
//   final String? icon;
//   bool selected = false;
//
//   PaintIncome(
//       {this.title,
//       this.title2,
//       this.colorPicture1,
//       this.colorPicture2,
//       this.icon});
// }
