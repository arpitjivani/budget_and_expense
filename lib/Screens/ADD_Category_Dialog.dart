import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Demo/dialog.dart';
import 'package:spendee_budget_and_expense/Screens/add_categories_expense.dart';
import 'package:spendee_budget_and_expense/Screens/add_category_income.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

class AddCategoryDialog extends StatefulWidget {
  VoidCallback onSuccess;

  AddCategoryDialog(BuildContext context, {Key? key, required this.onSuccess})
      : super(key: key);

  @override
  _AddCategoryDialogState createState() => _AddCategoryDialogState();
}

const double width = 240.0;
const double height = 50.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  List<Map<dynamic, PaintExpense>> firebaseList = [];
  List<Map<dynamic, PaintIncome>> firebaseList2 = [];
  final List<PaintIncome> list2 = [];
  final List<PaintExpense> list = [];
  late Query _reference;
  late Query _referenceIncome;

  String? getUId;

  void getEmailToStorage() async {
    getUId = await getStringFromLocalStorage(KEY_USER_UID);
    _reference = FirebaseDatabase.instance
        .ref()
        .child("UserData")
        .child("$getUId")
        .child('AddNewCategoryExpense');
    getCategory();
    getCategoryIncome();
    _referenceIncome = FirebaseDatabase.instance
        .ref()
        .child("UserData")
        .child("$getUId")
        .child('AddNewCategoryIncome');
    setState(() {});
  }

  @override
  void initState() {
    getEmailToStorage();
    super.initState();
    // _referenceNew =
    //     FirebaseDatabase.instance.reference().child('AddNewCategory');
    // saveCategory();
  }

  getCategory() async {
    // print("getCategoryExpense -> ");

    var firebaseSnapshot = await FirebaseDatabase.instance
        .ref()
        .child("UserData")
        .child("$getUId")
        .child("AddNewCategoryExpense");

    firebaseSnapshot.onChildChanged.listen((event) {
      // print("On value changed ${event.snapshot.key}");
      // firebaseList.add(values);
      firebaseList.forEach((Map element) {
        if (element.containsKey(event.snapshot.key)) {
          final user = PaintExpense.fromJson(Map<String, dynamic>.from(
              jsonDecode(jsonEncode(event.snapshot.value))));
          // print("user --> ${user}");
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
    // print("^^^${paintsExpense}");
    firebaseList = paintsExpense;
    if (snapshot.value != null) {
      // correct
      list.forEach((element) {
        // print("ElementIncome -> ${element.title}");
      });
      Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;

      values.forEach((key, value) {
        // print("ValutyeIncome -> ${value.runtimeType}");
        PaintExpense user =
            PaintExpense.fromJson(Map<String, dynamic>.from(value));
        // print("ValutyeIncome -> ${user.toJson()}");

        firebaseList.add({key: user});
        list.add(user);
        // print("------>");
        // print(list.length);
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
    // print("getCategoryIncome -> ");

    var firebaseSnapshot = await FirebaseDatabase.instance
        .ref()
        .child("UserData")
        .child("$getUId")
        .child("AddNewCategoryIncome");

    firebaseSnapshot.onChildChanged.listen((event) {
      // print("On value changed ${event.snapshot.key}");
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
        // print("ElementIncome -> ${element.title}");
      });
      Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;

      values.forEach((key, value) {
        // print("ValutyeIncome -> ${value.runtimeType}");
        final user = PaintIncome.fromJson(Map<String, dynamic>.from(value));
        firebaseList2.add({key: user});
        list2.add(user);
        // print("------>");
        // print(list2.length);
      });
    } else {
      // list2.addAll(paintsExpense);
      // list2.forEach((element) {
      //   print("Element -> ${element.title}");
      // });
    }
    setState(() {});
  }

  List<Map<dynamic, PaintExpense>> paintsExpense = <Map<dynamic, PaintExpense>>[
    {
      "": PaintExpense(
          title: 'Food/Drink ',
          title2: '0 Transaction in 0 Wallet',
          colorPicture1: Color(0xff016BB8),
          colorPicture2: Color(0xff11A8FD),
          // colorPicture1: Color.fromARGB(1, 1, 107, 184),
          // colorPicture2: Color.fromARGB(1, 17, 168, 253),
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

  @override
  Widget build(BuildContext context) {
    int _toggleValue = 0;
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [Color(0xff2C3036), Color(0xff1C1F22)],
          ),
          border: Border.all(
              color: const Color(0xff000000).withOpacity(0.05), width: 2),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff1F2427).withOpacity(0.4),
                // color: Colors.red.withOpacity(0.8),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(4, 4)),
            BoxShadow(
                color: const Color(0xff484E53).withOpacity(0.2),
                // color: Colors.yellow.withOpacity(0.6),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(-2, -4)),
          ],
          borderRadius: BorderRadius.circular(20.0)),
      height: Get.height / 1.5,
      padding: const EdgeInsets.all(0.0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CommonText(
                        text: "Budget For",
                        size: 16.0,
                        weight: FontWeight.w500,
                        color: Colors.white),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    return Expanded(
                      child: SizedBox(
                        height: double.infinity,
                        child: Column(
                          children: [
                            AnimatedToggle(
                              values: const ['Expense', 'Income'],
                              onToggleCallback: (value) {
                                setState(() {
                                  _toggleValue = value;
                                });
                              },
                              height: height,
                              width: width,
                              backgroundColor: Colors.transparent,
                              textColor: const Color(0xFFFFFFFF),
                            ),
                            _toggleValue == 0
                                ? Expanded(
                                    // child: GridView.count(
                                    //     mainAxisSpacing: 10.0,
                                    //     crossAxisCount: 3,
                                    //     children: List.generate(
                                    //         choicesExpense.length, (index) {
                                    //       return Center(
                                    //         child: ChoiceCard(
                                    //           value: _toggleValue,
                                    //           choice: choicesExpense[index],
                                    //           onSuccess: () {
                                    //             widget.onSuccess();
                                    //           },
                                    //         ),
                                    //       );
                                    //     })),
                                    child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3),
                                        shrinkWrap: true,
                                        itemCount: firebaseList.length,
                                        itemBuilder: (BuildContext ctx, index) {
                                          var exp = firebaseList[index]
                                              .values
                                              .toList()
                                              .first;
                                          return GridTile(
                                              child: Card(
                                                  color: Colors.transparent,
                                                  elevation: 0.0,
                                                  child: Center(
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .push(
                                                                MaterialPageRoute(
                                                          builder: (context) =>
                                                              AddCategoriesExpense(
                                                                  data: exp),
                                                        ));
                                                      },
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      // image: DecorationImage(
                                                                      //   image: AssetImage(choice.image),
                                                                      // ),
                                                                      gradient:
                                                                          LinearGradient(
                                                                        begin: Alignment
                                                                            .topLeft,
                                                                        end: Alignment
                                                                            .bottomLeft,
                                                                        colors: [
                                                                          exp.colorPicture1!,
                                                                          exp.colorPicture2!,
                                                                        ],
                                                                      ),
                                                                      border: Border.all(
                                                                          color: const Color(0xff000000).withOpacity(
                                                                              0.05),
                                                                          width:
                                                                              2),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                            color: const Color(0xff1F2427).withOpacity(
                                                                                0.5),
                                                                            // color: Colors.red.withOpacity(0.8),
                                                                            blurRadius:
                                                                                5,
                                                                            spreadRadius:
                                                                                0,
                                                                            offset:
                                                                                const Offset(4, 4)),
                                                                        BoxShadow(
                                                                            color: const Color(0xff484E53).withOpacity(
                                                                                0.3),
                                                                            // color: Colors.yellow.withOpacity(0.6),
                                                                            blurRadius:
                                                                                5,
                                                                            spreadRadius:
                                                                                0,
                                                                            offset:
                                                                                const Offset(-2, -4)),
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        12.0),
                                                                child: Image.asset(
                                                                    "${exp.icon}",
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 5.0,
                                                            ),
                                                            Flexible(
                                                              child: CommonText(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  text:
                                                                      "${exp.title}",
                                                                  size: 14.0,
                                                                  weight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.5)),
                                                            )
                                                          ]),
                                                    ),
                                                  )));
                                        }),
                                  )
                                : Expanded(
                                    child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3),
                                        shrinkWrap: true,
                                        itemCount: firebaseList2.length,
                                        itemBuilder: (BuildContext ctx, index) {
                                          var exp = firebaseList2[index]
                                              .values
                                              .toList()[0];
                                          return GridTile(
                                              child: Card(
                                                  color: Colors.transparent,
                                                  elevation: 0.0,
                                                  child: Center(
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .push(
                                                                MaterialPageRoute(
                                                          builder: (context) =>
                                                              AddCategoriesIncome(
                                                                  data: exp),
                                                        ));
                                                      },
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      // image: DecorationImage(
                                                                      //   image: AssetImage(choice.image),
                                                                      // ),
                                                                      gradient:
                                                                          LinearGradient(
                                                                        begin: Alignment
                                                                            .topLeft,
                                                                        end: Alignment
                                                                            .bottomLeft,
                                                                        colors: [
                                                                          exp.colorPicture1!,
                                                                          exp.colorPicture2!,
                                                                        ],
                                                                      ),
                                                                      border: Border.all(
                                                                          color: const Color(0xff000000).withOpacity(
                                                                              0.05),
                                                                          width:
                                                                              2),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                            color: const Color(0xff1F2427).withOpacity(
                                                                                0.5),
                                                                            // color: Colors.red.withOpacity(0.8),
                                                                            blurRadius:
                                                                                5,
                                                                            spreadRadius:
                                                                                0,
                                                                            offset:
                                                                                const Offset(4, 4)),
                                                                        BoxShadow(
                                                                            color: const Color(0xff484E53).withOpacity(
                                                                                0.3),
                                                                            // color: Colors.yellow.withOpacity(0.6),
                                                                            blurRadius:
                                                                                5,
                                                                            spreadRadius:
                                                                                0,
                                                                            offset:
                                                                                const Offset(-2, -4)),
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        12.0),
                                                                child: Image.asset(
                                                                    "${exp.icon}",
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 5.0,
                                                            ),
                                                            Flexible(
                                                              child: CommonText(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  text:
                                                                      "${exp.title}",
                                                                  size: 14.0,
                                                                  weight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.5)),
                                                            )
                                                          ]),
                                                    ),
                                                  )));
                                        }),
                                  ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(1.10, -1.10),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xff2C3036), Color(0xff1C1F22)],
                    ),
                    border: Border.all(
                        color: const Color(0xff000000).withOpacity(0.05),
                        width: 2),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff1F2427).withOpacity(0.8),
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: const Offset(4, 4)),
                      BoxShadow(
                          color: const Color(0xff484E53).withOpacity(0.6),
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: const Offset(-2, -4)),
                    ],
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.close,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseChoice {
  const ExpenseChoice(
      {required this.title,
      required this.image,
      required this.color1,
      required this.color2});

  final String title;
  final String image;
  final Color color1;
  final Color color2;
}

// class ChoiceCard extends StatelessWidget {
//   const ChoiceCard(
//       {Key? key,
//       required this.choice,
//       required this.value,
//       required this.onSuccess})
//       : super(key: key);
//   final ExpenseChoice choice;
//   final int value;
//   final VoidCallback onSuccess;
//
//   @override
//   Widget build(BuildContext context) {
//     return GridTile(
//         child: Card(
//             color: Colors.transparent,
//             elevation: 0.0,
//             child: Center(
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context)
//                       .push(MaterialPageRoute(
//                     builder: (context) =>
//                         AddCategories(data: choice, categoryName: value),
//                   ))
//                       .then((value) {
//                     this.onSuccess();
//                   });
//                 },
//                 child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         width: 60.0,
//                         height: 60.0,
//                         decoration: BoxDecoration(
//                             // image: DecorationImage(
//                             //   image: AssetImage(choice.image),
//                             // ),
//                             gradient: LinearGradient(
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomLeft,
//                               colors: [choice.color1, choice.color2],
//                             ),
//                             border: Border.all(
//                                 color:
//                                     const Color(0xff000000).withOpacity(0.05),
//                                 width: 2),
//                             boxShadow: [
//                               BoxShadow(
//                                   color:
//                                       const Color(0xff1F2427).withOpacity(0.5),
//                                   // color: Colors.red.withOpacity(0.8),
//                                   blurRadius: 5,
//                                   spreadRadius: 0,
//                                   offset: const Offset(4, 4)),
//                               BoxShadow(
//                                   color:
//                                       const Color(0xff484E53).withOpacity(0.3),
//                                   // color: Colors.yellow.withOpacity(0.6),
//                                   blurRadius: 5,
//                                   spreadRadius: 0,
//                                   offset: const Offset(-2, -4)),
//                             ],
//                             shape: BoxShape.circle),
//                         child: Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Image.asset(choice.image, color: Colors.white),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5.0,
//                       ),
//                       Flexible(
//                         child: CommonText(
//                             overflow: TextOverflow.ellipsis,
//                             text: choice.title,
//                             size: 14.0,
//                             weight: FontWeight.w500,
//                             color: Colors.white.withOpacity(0.5)),
//                       )
//                     ]),
//               ),
//             )));
//   }
// }

class PaintExpense {
  final String? title;
  final String? title2;
  final String? firebaseKey;
  final Color? colorPicture1;
  final dynamic colorPicture2;
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

// class ChoiceCardNew extends StatelessWidget {
//
//   const ChoiceCardNew({Key? key, required this.choice, required this.value,required this.onSuccess})
//       : super(key: key);
//   final ExpenseChoice choice;
//   final int value;
//   final VoidCallback onSuccess;
//
//   @override
//   Widget build(BuildContext context) {
//     return GridTile(
//         child: Card(
//             color: Colors.transparent,
//             elevation: 0.0,
//             child: Center(
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) =>
//                         AddCategories(data: choice, categoryName: value),
//                   )).then((value) {
//                     this.onSuccess();
//                   });
//                 },
//                 child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         width: 60.0,
//                         height: 60.0,
//                         decoration: BoxDecoration(
//                             // image: DecorationImage(
//                             //   image: AssetImage(choice.image),
//                             // ),
//                             gradient: LinearGradient(
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomLeft,
//                               colors: [choice.color1, choice.color2],
//                             ),
//                             border: Border.all(
//                                 color:
//                                     const Color(0xff000000).withOpacity(0.05),
//                                 width: 2),
//                             boxShadow: [
//                               BoxShadow(
//                                   color:
//                                       const Color(0xff1F2427).withOpacity(0.5),
//                                   // color: Colors.red.withOpacity(0.8),
//                                   blurRadius: 5,
//                                   spreadRadius: 0,
//                                   offset: const Offset(4, 4)),
//                               BoxShadow(
//                                   color:
//                                       const Color(0xff484E53).withOpacity(0.3),
//                                   // color: Colors.yellow.withOpacity(0.6),
//                                   blurRadius: 5,
//                                   spreadRadius: 0,
//                                   offset: const Offset(-2, -4)),
//                             ],
//                             shape: BoxShape.circle),
//                         child: Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Image.asset(
//                             choice.image,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5.0,
//                       ),
//                       Flexible(
//                         child: CommonText(
//                             overflow: TextOverflow.ellipsis,
//                             text: choice.title,
//                             size: 14.0,
//                             weight: FontWeight.w500,
//                             color: Colors.white.withOpacity(0.5)),
//                       )
//                     ]),
//               ),
//             )));
//   }
// }
