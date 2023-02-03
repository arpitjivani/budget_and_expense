import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_button.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_container.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_scaffold.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

class AddNewBudgetScreen extends StatefulWidget {
  const AddNewBudgetScreen({Key? key}) : super(key: key);

  @override
  _AddNewBudgetScreenState createState() => _AddNewBudgetScreenState();
}

const double height = 50.0;

class _AddNewBudgetScreenState extends State<AddNewBudgetScreen> {
  final TextEditingController _walletNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  late List<Item> itemList;
  late List<Item> selectedList;

  double? _currentValue = 0;
  late DatabaseReference _reference;

  String? getUId;

  void getEmailToStorage() async {
    getUId = await getStringFromLocalStorage(KEY_USER_UID);
    // print("-8-8-8-8-${getUId}");
    // print("====++++$_reference");
    setState(() {});
  }

  @override
  void initState() {
    getEmailToStorage();
    loadList();
    _reference = FirebaseDatabase.instance.ref().child('UserData');
    super.initState();
  }

  loadList() {
    itemList = [];
    selectedList = [];
    itemList
        .add(Item("assets/HomePage/Expense_Category/beauty.png", "Beauty", 0));
    itemList.add(
        Item("assets/HomePage/Expense_Category/bill.png", "Bills & Fees", 1));
    itemList.add(Item("assets/HomePage/Expense_Category/car.png", "Car", 2));
    itemList.add(
        Item("assets/HomePage/Expense_Category/education.png", "Education", 3));
    itemList.add(Item(
        "assets/HomePage/Expense_Category/healthcare.png", "Entertainment", 4));
    itemList.add(Item("assets/HomePage/Expense_Category/healthcare.png",
        "Family & Personal", 5));
    itemList.add(
        Item("assets/HomePage/Expense_Category/food.png", "Food & Drink", 6));
    itemList.add(
        Item("assets/HomePage/Expense_Category/healthcare.png", "Gifts", 7));
    itemList.add(
        Item("assets/HomePage/Expense_Category/groceries.png", "Groceries", 8));
    itemList.add(Item(
        "assets/HomePage/Expense_Category/healthcare.png", "HealthCare", 9));
    itemList.add(
        Item("assets/HomePage/Expense_Category/healthcare.png", "Home", 10));
    itemList.add(
        Item("assets/HomePage/Expense_Category/shopping.png", "Shopping", 11));
    itemList.add(Item("assets/HomePage/Expense_Category/healthcare.png",
        "Sports & Hobbies", 12));
    itemList.add(Item(
        "assets/HomePage/Expense_Category/transport.png", "Transport", 13));
    itemList
        .add(Item("assets/HomePage/Expense_Category/travel.png", "Travel", 14));
    itemList.add(
        Item("assets/HomePage/Expense_Category/healthcare.png", "Work", 15));
    itemList.add(
        Item("assets/HomePage/Expense_Category/healthcare.png", "Other", 16));
  }

  @override
  Widget build(BuildContext context) {
    // =========================== Calculator =============================
    var calc = SimpleCalculator(
      value: _currentValue!,
      hideExpression: false,
      hideSurroundingBorder: true,
      autofocus: true,
      onChanged: (key, value, expression) {
        setState(() {
          _currentValue = value ?? 0;
        });
        if (kDebugMode) {
          print('$key\t$value\t$expression');
        }
      },
      onTappedDisplay: (value, details) {
        if (kDebugMode) {
          print('$value\t${details.globalPosition}');
        }
      },
      theme: CalculatorThemeData(
        borderColor: Colors.white.withOpacity(0.1),
        borderWidth: 2,
        displayColor: Colors.transparent,
        displayStyle: const TextStyle(fontSize: 80, color: Color(0xff058DD9)),
        expressionColor: Colors.transparent,
        expressionStyle: const TextStyle(fontSize: 20, color: Colors.white),
        operatorColor: Colors.transparent,
        operatorStyle: const TextStyle(fontSize: 20, color: Colors.white),
        commandColor: Colors.transparent,
        commandStyle: const TextStyle(fontSize: 20, color: Colors.white),
        numColor: Colors.transparent,
        numStyle: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SingleChildScrollView(
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
                                    Navigator.of(context).pop();
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
                                            color:
                                                Colors.black.withOpacity(0.05)),
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
                                            "assets/left_arrow.png",
                                            color: const Color(0xff7F8489)),
                                      )),
                                ),
                                const CommonText(
                                    text: "Add New Budget",
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
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: <Widget>[
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    height: 55.0,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xff1C1F22),
                                            Color(0xff2C3036)
                                          ],
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    margin: const EdgeInsets.only(top: 16),
                                    child: TextFormField(
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontFamily: "SpaceFont",
                                            fontWeight: FontWeight.w500),
                                        controller: _walletNameController,
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                fontFamily: "SpaceFont",
                                                fontWeight: FontWeight.w500),
                                            hintText: "Budget Name",
                                            hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                fontFamily: "SpaceFont",
                                                fontWeight: FontWeight.w500)))),
                                Container(
                                    height: 55.0,
                                    margin: const EdgeInsets.only(top: 16),
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xff1C1F22),
                                            Color(0xff2C3036)
                                          ],
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Image.asset(
                                          "assets/BudgetPage/budget.png"),
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    width: MediaQuery.of(context).size.width /
                                        1.45,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xff2F353A),
                                            Color(0xff1C1F22)
                                          ],
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    margin: const EdgeInsets.only(top: 16),
                                    child: TextFormField(
                                        onTap: () {
                                          showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end: Alignment.bottomLeft,
                                                      colors: [
                                                        Color(0xff2C3036),
                                                        Color(0xff1C1F22)
                                                      ],
                                                    ),
                                                    border: Border.all(
                                                        color: const Color(
                                                                0xff000000)
                                                            .withOpacity(0.05),
                                                        width: 2),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: const Color(
                                                                  0xff1F2427)
                                                              .withOpacity(0.4),
                                                          // color: Colors.red.withOpacity(0.8),
                                                          blurRadius: 10,
                                                          spreadRadius: 0,
                                                          offset: const Offset(
                                                              4, 4)),
                                                      BoxShadow(
                                                          color: const Color(
                                                                  0xff484E53)
                                                              .withOpacity(0.2),
                                                          // color: Colors.yellow.withOpacity(0.6),
                                                          blurRadius: 10,
                                                          spreadRadius: 0,
                                                          offset: const Offset(
                                                              -2, -4)),
                                                    ],
                                                  ),
                                                  child: SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.50,
                                                      child: calc),
                                                );
                                              });
                                        },
                                        readOnly: true,
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontFamily: "SpaceFont",
                                            fontWeight: FontWeight.w500),
                                        controller: _nameController,
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                fontFamily: "SpaceFont",
                                                fontWeight: FontWeight.w500),
                                            hintText: _currentValue.toString(),
                                            hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                fontFamily: "SpaceFont",
                                                fontWeight: FontWeight.w500)))),
                                Container(
                                    margin: const EdgeInsets.only(top: 16),
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xff2F353A),
                                            Color(0xff1C1F22)
                                          ],
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 20.0,
                                          width: 1.0,
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        CommonText(
                                            text: "  ₹  ",
                                            size: 18.0,
                                            weight: FontWeight.w500,
                                            color:
                                                Colors.white.withOpacity(0.5)),
                                      ],
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            CommonContainer2(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          Fluttertoast.showToast(msg: "Wallet");
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/WalletPage/wallet.png",
                                              width: 30.0,
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CommonText(
                                                    text: "Wallet",
                                                    align: TextAlign.center,
                                                    size: 16.0,
                                                    weight: FontWeight.w500,
                                                    color: Colors.white
                                                        .withOpacity(0.3)),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                Image.asset(
                                                  "assets/BudgetPage/small_right_arrow.png",
                                                  width: 16.0,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
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
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                Dialog(
                                                    insetPadding:
                                                        const EdgeInsets
                                                            .all(25.0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0)),
                                                    elevation: 0.0,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          gradient:
                                                              const LinearGradient(
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomLeft,
                                                            colors: [
                                                              Color(0xff2C3036),
                                                              Color(0xff1C1F22)
                                                            ],
                                                          ),
                                                          border: Border.all(
                                                              color: const Color(
                                                                      0xff000000)
                                                                  .withOpacity(
                                                                      0.05),
                                                              width: 2),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: const Color(
                                                                        0xff1F2427)
                                                                    .withOpacity(
                                                                        0.4),
                                                                // color: Colors.red.withOpacity(0.8),
                                                                blurRadius: 10,
                                                                spreadRadius: 0,
                                                                offset:
                                                                    const Offset(
                                                                        4, 4)),
                                                            BoxShadow(
                                                                color: const Color(
                                                                        0xff484E53)
                                                                    .withOpacity(
                                                                        0.2),
                                                                // color: Colors.yellow.withOpacity(0.6),
                                                                blurRadius: 10,
                                                                spreadRadius: 0,
                                                                offset:
                                                                    const Offset(
                                                                        -2,
                                                                        -4)),
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0)),
                                                      height: Get.height / 1.5,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0.0),
                                                      child: Stack(
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: const [
                                                                    CommonText(
                                                                        text:
                                                                            "Budget For",
                                                                        size:
                                                                            16.0,
                                                                        weight: FontWeight
                                                                            .w500,
                                                                        color: Colors
                                                                            .white),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 10.0,
                                                                ),
                                                                StatefulBuilder(
                                                                  builder: (context,
                                                                      setState) {
                                                                    return Expanded(
                                                                      child:
                                                                          SizedBox(
                                                                        height:
                                                                            double.infinity,
                                                                        child: GridView.builder(
                                                                            itemCount: itemList.length,
                                                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                              crossAxisCount: 3,
                                                                            ),
                                                                            itemBuilder: (context, index) {
                                                                              return GridItem(
                                                                                  item: itemList[index],
                                                                                  isSelected: (bool value) {
                                                                                    setState(() {
                                                                                      if (value) {
                                                                                        selectedList.add(itemList[index]);
                                                                                      } else {
                                                                                        selectedList.remove(itemList[index]);
                                                                                      }
                                                                                    });
                                                                                    print("+++++++$index : ${itemList[index].text.length}");
                                                                                  },
                                                                                  key: Key(itemList[index].rank.toString()));
                                                                            }),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const Alignment(
                                                                    1.10,
                                                                    -1.10),
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        gradient:
                                                                            const LinearGradient(
                                                                          begin:
                                                                              Alignment.topLeft,
                                                                          end: Alignment
                                                                              .bottomLeft,
                                                                          colors: [
                                                                            Color(0xff2C3036),
                                                                            Color(0xff1C1F22)
                                                                          ],
                                                                        ),
                                                                        border: Border.all(
                                                                            color: const Color(0xff000000).withOpacity(
                                                                                0.05),
                                                                            width:
                                                                                2),
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
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Icon(
                                                                    Icons.close,
                                                                    color: Colors
                                                                        .white
                                                                        .withOpacity(
                                                                            0.5),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/BudgetPage/category.png",
                                              width: 30.0,
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CommonText(
                                                    text: "Budget for",
                                                    align: TextAlign.center,
                                                    size: 16.0,
                                                    weight: FontWeight.w500,
                                                    color: Colors.white
                                                        .withOpacity(0.3)),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                Image.asset(
                                                  "assets/BudgetPage/small_right_arrow.png",
                                                  width: 16.0,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    height: 55.0,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xff1C1F22),
                                            Color(0xff2C3036)
                                          ],
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    margin: const EdgeInsets.only(top: 16),
                                    child: TextFormField(
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontFamily: "SpaceFont",
                                            fontWeight: FontWeight.w500),
                                        controller: _categoryController,
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                fontFamily: "SpaceFont",
                                                fontWeight: FontWeight.w500),
                                            hintText: "Recurrence",
                                            hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                fontFamily: "SpaceFont",
                                                fontWeight: FontWeight.w500)))),
                                Container(
                                    height: 55.0,
                                    margin: const EdgeInsets.only(top: 16),
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xff1C1F22),
                                            Color(0xff2C3036)
                                          ],
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Image.asset(
                                          "assets/Add_Categories/calendar.png"),
                                    )),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    width: MediaQuery.of(context).size.width /
                                        1.45,
                                    height: 55.0,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xff1C1F22),
                                            Color(0xff2C3036)
                                          ],
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    margin: const EdgeInsets.only(top: 16),
                                    child: TextFormField(
                                        onTap: () {
                                          _selectDate(context);
                                        },
                                        readOnly: true,
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontFamily: "SpaceFont",
                                            fontWeight: FontWeight.w500),
                                        controller: _nameController,
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                fontFamily: "SpaceFont",
                                                fontWeight: FontWeight.w500),
                                            hintText:
                                                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                                            hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                fontFamily: "SpaceFont",
                                                fontWeight: FontWeight.w500)))),
                                Container(
                                    height: 55.0,
                                    margin: const EdgeInsets.only(top: 16),
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xff1C1F22),
                                            Color(0xff2C3036)
                                          ],
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 20.0,
                                          width: 1.0,
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Image.asset(
                                              "assets/BudgetPage/date.png"),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: CommonButton(
                          text: "Create New Budget",
                          onTap: () {
                            saveCategory();
                          }),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }



  void saveCategory() {
    String? budgetName = _nameController.text;
    String amount = _currentValue.toString();
    String item = itemList[0].text.toString();
    String date =
        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";

    Map<void, void> contact = {
      'budgetName': budgetName,
      'amount': amount,
      'date': date,
      'item': item,
    };

    _reference
        .child(getUId!)
        .child("Budget")
        .push()
        .set(contact)
        .then((value) {
      Navigator.pop(context);
    });
  }

  // =========================== DATE PICKER =============================
  _selectDate(BuildContext context) async {
    final DateTime? newDateTime = await showRoundedDatePicker(
      // background: Colors.black.withOpacity(0.3),
      context: context,
      initialDate: DateTime.now(),
      fontFamily: "SpaceFont",
      firstDate: DateTime(2000),
      lastDate: DateTime(DateTime.now().year + 3),
      borderRadius: 16,
      height: MediaQuery.of(context).size.height / 3,
      styleDatePicker: MaterialRoundedDatePickerStyle(
        backgroundPicker: mainBG1,
        backgroundActionBar: mainBG1,
        backgroundHeaderMonth: mainBG1,
        textStyleDayHeader: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: "SpaceFont",
        ),
        textStyleDayOnCalendarSelected: const TextStyle(
            fontFamily: "SpaceFont",
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold),
        decorationDateSelected: const BoxDecoration(
            color: Color(0xff058DD9), shape: BoxShape.circle),
        textStyleDayOnCalendar: TextStyle(
          fontSize: 18.0,
          color: Colors.white.withOpacity(0.5),
          fontFamily: "SpaceFont",
        ),
        textStyleMonthYearHeader: const TextStyle(
            fontSize: 16,
            fontFamily: "SpaceFont",
            color: Colors.white,
            fontWeight: FontWeight.bold),
        textStyleCurrentDayOnCalendar: const TextStyle(
            fontFamily: "SpaceFont",
            fontSize: 20.0,
            color: Color(0xff058DD9),
            fontWeight: FontWeight.bold),
        sizeArrow: 30,
        colorArrowNext: const Color(0xff058DD9),
        colorArrowPrevious: const Color(0xff058DD9),
        marginTopArrowPrevious: 16,
        paddingDatePicker: const EdgeInsets.all(0),
        paddingMonthHeader: const EdgeInsets.all(16),
        paddingActionBar: const EdgeInsets.all(16),
        textStyleButtonPositive: const TextStyle(
          fontSize: 14,
          color: Color(0xff058DD9),
          fontFamily: "SpaceFont",
        ),
        textStyleButtonNegative: TextStyle(
          fontSize: 14,
          color: Colors.white.withOpacity(0.5),
          fontFamily: "SpaceFont",
        ),
      ),
      styleYearPicker: MaterialRoundedYearPickerStyle(
        textStyleYear: TextStyle(
          fontSize: 16,
          color: Colors.white.withOpacity(0.5),
          fontFamily: "SpaceFont",
        ),
        textStyleYearSelected: const TextStyle(
            fontFamily: "SpaceFont",
            fontSize: 20,
            color: Color(0xff058DD9),
            fontWeight: FontWeight.bold),
        heightYearRow: 50,
        backgroundPicker: mainBG1,
      ),
      theme: ThemeData(
          primarySwatch: const MaterialColor(
        0xff353A40,
        <int, Color>{
          50: Color(0xff353A40),
          100: Color(0xff353A40),
          200: Color(0xff353A40),
          300: Color(0xff353A40),
          400: Color(0xff353A40),
          500: Color(0xff353A40),
          600: Color(0xff353A40),
          700: Color(0xff353A40),
          800: Color(0xff353A40),
          900: Color(0xff353A40),
        },
      )),
    );

    print(selectedDate);
    if (newDateTime != null) {
      setState(() => selectedDate = newDateTime);
    }
  }
}

class Item {
  String imageUrl;
  String text;
  int rank;

  Item(this.imageUrl, this.text, this.rank);
}

class GridItem extends StatefulWidget {
  final Key key;
  final Item item;
  final ValueChanged<bool> isSelected;

  GridItem({required this.item, required this.isSelected, required this.key});

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Stack(
        children: <Widget>[
          Card(
              color: Colors.transparent,
              elevation: 0.0,
              child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                            gradient: isSelected
                                ? LinearGradient(
                                    colors: [
                                      Color(0xff0160A5),
                                      Color(0xff11A7FC)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomLeft,
                                  )
                                : LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xff2C3036),
                                      Color(0xff1C1F22)
                                    ],
                                  ),
                            border: Border.all(
                                color:
                                    const Color(0xff000000).withOpacity(0.05),
                                width: 2),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color(0xff1F2427).withOpacity(0.5),
                                  // color: Colors.red.withOpacity(0.8),
                                  blurRadius: 5,
                                  spreadRadius: 0,
                                  offset: const Offset(4, 4)),
                              BoxShadow(
                                  color:
                                      const Color(0xff484E53).withOpacity(0.3),
                                  // color: Colors.yellow.withOpacity(0.6),
                                  blurRadius: 5,
                                  spreadRadius: 0,
                                  offset: const Offset(-2, -4)),
                            ],
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(widget.item.imageUrl,
                              color: isSelected ? Colors.white : null),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Flexible(
                        child: CommonText(
                            overflow: TextOverflow.ellipsis,
                            text: widget.item.text,
                            size: 14.0,
                            weight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.5)),
                      )
                    ]),
              )),
        ],
      ),
    );
  }
}
