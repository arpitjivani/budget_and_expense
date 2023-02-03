import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_add_button.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_container.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Screens/ADD_Category_Dialog.dart';
import 'package:spendee_budget_and_expense/Screens/chart.dart';
import 'package:spendee_budget_and_expense/Screens/edit_categories.dart';
import 'package:spendee_budget_and_expense/Screens/overview_screen.dart';
import 'package:spendee_budget_and_expense/controllers/HomeScreenControllers.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

class HomeScreen extends StatefulWidget {
  final Function dataDrawer;
  final Function data;

  const HomeScreen({
    Key? key,
    required this.dataDrawer,
    required this.data,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

const double width = 240.0;
const double height = 50.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;

class _HomeScreenState extends State<HomeScreen> {
  // late Query _reference;
  // late double xAlign;
  // late Color loginColor;
  // late Color signInColor;
  // num totalAmount = 0;
  // num chartExpenseAmount = 0;
  // num chartIncomeAmount = 0;
  //
  // String? getUId;

  // void getEmailToStorage() async {
  //   getUId = await getStringFromLocalStorage(KEY_USER_UID);
  //   print("KEY_USER_UID:$getUId");
  //   _reference = FirebaseDatabase.instance
  //       .ref()
  //       .child("UserData")
  //       .child("$getUId")
  //       .child("Wallet")
  //       .child("IncomeExpenseData");
  //   calculateTotal();
  //   chartExpenseTotal();
  //   chartIncomeTotal();
  //   setState(() {});
  // }

  @override
  void initState() {
    super.initState();
    // getEmailToStorage();
    // xAlign = loginAlign;
    // loginColor = selectedColor;
    // signInColor = normalColor;
  }

  // calculateTotal() {
  //   totalAmount = 0;
  //   _reference.get().asStream().forEach((event) {
  //     event.children.forEach((element) {
  //       var childVal = element.value as Map;
  //
  //       // print((element.value as Map));
  //       if ((element.value as Map)["categoryName"] == "Expense") {
  //         totalAmount -= num.parse(childVal["amount"].toString());
  //       } else {
  //         totalAmount += num.parse(childVal["amount"].toString());
  //       }
  //     });
  //   });
  //   print("AAAAAAA ===>>> $_reference");
  //   setState(() {});
  // }
  //
  // chartExpenseTotal() {
  //   chartExpenseAmount = 0;
  //   _reference.get().asStream().forEach((event) {
  //     event.children.forEach((element) {
  //       var childVal = element.value as Map;
  //
  //       // print((element.value as Map));
  //       if ((element.value as Map)["categoryName"] == "Expense") {
  //         chartExpenseAmount += num.parse(childVal["amount"].toString());
  //       } else {
  //         // chartExpenseAmount += num.parse(childVal["amount"].toString());
  //       }
  //     });
  //   });
  //   setState(() {});
  // }
  //
  // chartIncomeTotal() {
  //   chartIncomeAmount = 0;
  //   _reference.get().asStream().forEach((event) {
  //     event.children.forEach((element) {
  //       var childVal = element.value as Map;
  //
  //       // print((element.value as Map));
  //       if ((element.value as Map)["categoryName"] == "Income") {
  //         chartIncomeAmount += num.parse(childVal["amount"].toString());
  //       } else {
  //         // chartIncomeAmount += num.parse(childVal["amount"].toString());
  //       }
  //     });
  //   });
  //   setState(() {});
  // }

  bool isSearch = false;

  HomeScreenController _homeScreenController = new HomeScreenController();
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    print(searchText);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (controller) => Container(
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
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                      widget.dataDrawer();
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
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Fluttertoast.showToast(
                                              msg: '${getUIdFromStorage}');
                                        },
                                        child: CommonText(
                                            text: "Your Cash Flow",
                                            size: 16.0,
                                            weight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      CommonText(
                                          text:
                                              "₹ ${controller.totalAmount.toString()}",
                                          size: 18.0,
                                          weight: FontWeight.w700,
                                          color: Colors.white),
                                    ],
                                  ),
                                  isSearch
                                      ? Expanded(
                                          child: TextField(
                                            onChanged: (value) {
                                              searchText = value;
                                              setState(() {});
                                            },
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                icon: Icon(Icons.close),
                                                onPressed: () {
                                                  isSearch = !isSearch;
                                                  searchText = "";
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            isSearch = !isSearch;
                                            setState(() {
                                              print(isSearch);
                                            });
                                          },
                                          child: Container(
                                              width: 45.0,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    blurRadius: 5.0,
                                                  ),
                                                ],
                                                border: Border.all(
                                                    width: 2.0,
                                                    color: Colors.black
                                                        .withOpacity(0.05)),
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
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Image.asset(
                                                    "assets/HomePage/search.png",
                                                    color: const Color(
                                                        0xff7F8489)),
                                              )),
                                        ),
                                ],
                              ),
                            ),
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
                                                  color: const Color(0xff1F2427)
                                                      .withOpacity(0.8),
                                                  // color: Colors.red.withOpacity(0.8),
                                                  blurRadius: 10,
                                                  spreadRadius: 0,
                                                  offset: const Offset(4, 4)),
                                              BoxShadow(
                                                  color: const Color(0xff484E53)
                                                      .withOpacity(0.6),
                                                  // color: Colors.yellow.withOpacity(0.6),
                                                  blurRadius: 10,
                                                  spreadRadius: 0,
                                                  offset: const Offset(-2, -4)),
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
                                        Fluttertoast.showToast(msg: "By Month");
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
                                                  color: const Color(0xff1F2427)
                                                      .withOpacity(0.8),
                                                  // color: Colors.red.withOpacity(0.8),
                                                  blurRadius: 10,
                                                  spreadRadius: 0,
                                                  offset: const Offset(4, 4)),
                                              BoxShadow(
                                                  color: const Color(0xff484E53)
                                                      .withOpacity(0.6),
                                                  // color: Colors.yellow.withOpacity(0.6),
                                                  blurRadius: 10,
                                                  spreadRadius: 0,
                                                  offset: const Offset(-2, -4)),
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
                                  height: 10.0,
                                ),
                                CommonContainer(
                                  height: 170.0,
                                  padding: const EdgeInsets.all(5.0),
                                  // child: LegendOptions.withSampleData(data:chartTotal()),
                                  child:
                                      BarChartWithSecondaryAxis.withSampleData(
                                          data: _homeScreenController
                                              .chartExpenseAmount,
                                          data2: _homeScreenController
                                              .chartIncomeAmount),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => OverviewScreen(
                                        data: _homeScreenController
                                            .chartExpenseAmount,
                                        data2: _homeScreenController
                                            .chartIncomeAmount,
                                      ),
                                    ));
                                  },
                                  child: Row(
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
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                            // ignore: unnecessary_null_comparison
                            controller.reference == null
                                ? SizedBox()
                                : Expanded(
                                    child: RefreshIndicator(
                                      onRefresh: () async {
                                        controller.updateAllData();
                                      },
                                      child: FirebaseAnimatedList(
                                          reverse: true,
                                          defaultChild: const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          physics:
                                              const AlwaysScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          query: searchText.isEmpty? controller.reference!:controller.reference!.startAfter(searchText,key: "categoryName"),
                                          itemBuilder: (BuildContext context,
                                              DataSnapshot snapshot,
                                              Animation<double> animation,
                                              int index) {
                                            Map contact = snapshot.value as Map;
                                            contact['key'] = snapshot.key;
                                            return _addCategoryItem(
                                                category: contact);
                                          }),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 10.0, right: 20.0),
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
                                    child: AddCategoryDialog(
                                      context,
                                      onSuccess: () {
                                        setState(() {
                                          _homeScreenController
                                              .calculateTotal();
                                          _homeScreenController
                                              .chartExpenseTotal();
                                          _homeScreenController
                                              .chartIncomeTotal();
                                        });
                                      },
                                    )),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
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
                      uid: _homeScreenController.getUId,
                    )));
        // print("isBack -> $isBack");
        if (isBack != null) if (isBack) {
          setState(() {
            _homeScreenController.updateAllData();
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: Container(
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/WalletPage/bg.png"),
                  alignment: Alignment.topLeft),
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
                      child: InkWell(
                        onTap: () {
                          // print("category ===> ${category}");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(category['icon'].toString(),
                              color: Colors.white),
                        ),
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
                            text: category['mainCategory'].toString(),
                            size: 16.0,
                            weight: FontWeight.w500,
                            color: Colors.white),
                        const SizedBox(
                          height: 5.0,
                        ),
                        CommonText(
                            text: category['date'].toString(),
                            size: 13.0,
                            weight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.3)),
                        const SizedBox(
                          height: 5.0,
                        ),
                        if (category['image'] != null)
                          if (category['image'].toString().isNotEmpty)
                            // Image.memory(
                            //   base64Decode(category['image']),
                            //   width: 50.0,
                            //   height: 50.0,
                            // ),
                            InkWell(
                              onTap: () {
                                Fluttertoast.showToast(msg: "Image Show");
                              },
                              child: Container(
                                height: 50.0,
                                width: 60.0,
                                child: Image.memory(
                                  base64Decode(category['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
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
                        text: "-${category['amount'].toString()}",
                        size: 18.0,
                        weight: FontWeight.w600,
                        color: redColor)
                    : CommonText(
                        text: category['amount'].toString(),
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
