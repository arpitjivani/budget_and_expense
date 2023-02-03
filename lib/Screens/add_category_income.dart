import 'dart:convert';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_appbar.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_button.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_circular_indicator.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_container.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Screens/ADD_Category_Dialog.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

class AddCategoriesIncome extends StatefulWidget {
  final PaintIncome data;

  const AddCategoriesIncome({Key? key, required this.data}) : super(key: key);

  @override
  _AddCategoriesIncomeState createState() => _AddCategoriesIncomeState();
}

class _AddCategoriesIncomeState extends State<AddCategoriesIncome> {
  double? _currentValue = 0;
  bool isLoading = false;

  late final TextEditingController _noteController;
  DateTime selectedDate = DateTime.now();

  File? _image;

  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  late DatabaseReference _reference;

  String? getUId;

  void getEmailToStorage() async {
    getUId = await getStringFromLocalStorage(KEY_USER_UID);
    _noteController = TextEditingController();
    _reference = FirebaseDatabase.instance.ref().child('UserData');
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
    return Scaffold(
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
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 90.0),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 40.0,
                              ),
                              Stack(
                                clipBehavior: Clip.none,
                                alignment: AlignmentDirectional.topCenter,
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
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Container(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 24),
                                              width: MediaQuery.of(context).size.width /
                                                  1.6,
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
                                                      topLeft:
                                                          Radius.circular(20),
                                                      bottomLeft:
                                                          Radius.circular(20))),
                                              margin: const EdgeInsets.only(
                                                  top: 16),
                                              child: TextFormField(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  const LinearGradient(
                                                                begin: Alignment
                                                                    .topLeft,
                                                                end: Alignment
                                                                    .bottomLeft,
                                                                colors: [
                                                                  Color(
                                                                      0xff2C3036),
                                                                  Color(
                                                                      0xff1C1F22)
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
                                                                    blurRadius:
                                                                        10,
                                                                    spreadRadius:
                                                                        0,
                                                                    offset:
                                                                        const Offset(
                                                                            4,
                                                                            4)),
                                                                BoxShadow(
                                                                    color: const Color(
                                                                            0xff484E53)
                                                                        .withOpacity(
                                                                            0.2),
                                                                    // color: Colors.yellow.withOpacity(0.6),
                                                                    blurRadius:
                                                                        10,
                                                                    spreadRadius:
                                                                        0,
                                                                    offset:
                                                                        const Offset(
                                                                            -2,
                                                                            -4)),
                                                              ],
                                                            ),
                                                            child: SizedBox(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.50,
                                                                child: calc),
                                                          );
                                                        });
                                                  },
                                                  readOnly: true,
                                                  style: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                      fontFamily: "SpaceFont",
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      labelStyle: TextStyle(
                                                          color: Colors.white
                                                              .withOpacity(0.5),
                                                          fontFamily: "SpaceFont",
                                                          fontWeight: FontWeight.w500),
                                                      hintText: _currentValue.toString(),
                                                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5), fontFamily: "SpaceFont", fontWeight: FontWeight.w500)))),
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  top: 16),
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomLeft,
                                                    colors: [
                                                      Color(0xff2F353A),
                                                      Color(0xff1C1F22)
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20))),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 20.0,
                                                    width: 1.0,
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                  ),
                                                  const SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  CommonText(
                                                      text: "  ₹  ",
                                                      size: 18.0,
                                                      weight: FontWeight.w500,
                                                      color: Colors.white
                                                          .withOpacity(0.5)),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: -35,
                                      child: Container(
                                        width: 65.0,
                                        height: 65.0,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2.0,
                                                color: const Color(0xff11A8FD)),
                                            gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xff0160A5),
                                                Color(0xff11A7FC)
                                              ],
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
                                            shape: BoxShape.circle),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                              "assets/WalletPage/wallet.png",
                                              color: Colors.white),
                                        ),
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              SizedBox(
                                height: 230,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext
                                                                context) =>
                                                            Dialog(
                                                              insetPadding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      25.0),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0)),
                                                              elevation: 0.0,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
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
                                                                              color: const Color(0xff1F2427).withOpacity(0.4),
                                                                              // color: Colors.red.withOpacity(0.8),
                                                                              blurRadius: 10,
                                                                              spreadRadius: 0,
                                                                              offset: const Offset(4, 4)),
                                                                          BoxShadow(
                                                                              color: const Color(0xff484E53).withOpacity(0.4),
                                                                              // color: Colors.yellow.withOpacity(0.6),
                                                                              blurRadius: 10,
                                                                              spreadRadius: 0,
                                                                              offset: const Offset(-2, -4)),
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0)),
                                                                height:
                                                                    Get.height /
                                                                        2.5,
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        0.0),
                                                                child: Stack(
                                                                  children: <
                                                                      Widget>[
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          const SizedBox(
                                                                            height:
                                                                                10.0,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: const [
                                                                              CommonText(text: "Select Wallet", size: 18.0, weight: FontWeight.w500, color: Colors.white),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10.0,
                                                                          ),
                                                                          StatefulBuilder(
                                                                            builder:
                                                                                (context, setState) {
                                                                              return Expanded(
                                                                                child: SizedBox(
                                                                                  height: double.infinity,
                                                                                  child: SingleChildScrollView(
                                                                                    child: Column(
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(10.0),
                                                                                          child: InkWell(
                                                                                            onTap: () {},
                                                                                            child: CommonContainer2(
                                                                                              child: Row(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0, right: 10.0),
                                                                                                    child: Image.asset(
                                                                                                      "assets/WalletPage/wallet_3d.png",
                                                                                                      width: 45.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      CommonText(text: "Cash Wallet", size: 14.0, weight: FontWeight.w500, color: Colors.white.withOpacity(0.5)),
                                                                                                      const SizedBox(
                                                                                                        height: 5.0,
                                                                                                      ),
                                                                                                      const CommonText(text: "₹ 25,000", size: 16.0, weight: FontWeight.w700, color: Colors.white),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(10.0),
                                                                                          child: InkWell(
                                                                                            onTap: () {},
                                                                                            child: CommonContainer2(
                                                                                              child: Row(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0, right: 10.0),
                                                                                                    child: Image.asset(
                                                                                                      "assets/WalletPage/wallet_3d.png",
                                                                                                      width: 45.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      CommonText(text: "Cash Wallet", size: 14.0, weight: FontWeight.w500, color: Colors.white.withOpacity(0.5)),
                                                                                                      const SizedBox(
                                                                                                        height: 5.0,
                                                                                                      ),
                                                                                                      const CommonText(text: "₹ 25,000", size: 16.0, weight: FontWeight.w700, color: Colors.white),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(10.0),
                                                                                          child: InkWell(
                                                                                            onTap: () {},
                                                                                            child: CommonContainer2(
                                                                                              child: Row(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0, right: 10.0),
                                                                                                    child: Image.asset(
                                                                                                      "assets/WalletPage/wallet_3d.png",
                                                                                                      width: 45.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      CommonText(text: "Cash Wallet", size: 14.0, weight: FontWeight.w500, color: Colors.white.withOpacity(0.5)),
                                                                                                      const SizedBox(
                                                                                                        height: 5.0,
                                                                                                      ),
                                                                                                      const CommonText(text: "₹ 25,000", size: 16.0, weight: FontWeight.w700, color: Colors.white),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(10.0),
                                                                                          child: InkWell(
                                                                                            onTap: () {},
                                                                                            child: CommonContainer2(
                                                                                              child: Row(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0, right: 10.0),
                                                                                                    child: Image.asset(
                                                                                                      "assets/WalletPage/wallet_3d.png",
                                                                                                      width: 45.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      CommonText(text: "Cash Wallet", size: 14.0, weight: FontWeight.w500, color: Colors.white.withOpacity(0.5)),
                                                                                                      const SizedBox(
                                                                                                        height: 5.0,
                                                                                                      ),
                                                                                                      const CommonText(text: "₹ 25,000", size: 16.0, weight: FontWeight.w700, color: Colors.white),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: const Alignment(
                                                                          1.10,
                                                                          -1.10),
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          decoration: BoxDecoration(
                                                                              gradient: const LinearGradient(
                                                                                begin: Alignment.topLeft,
                                                                                end: Alignment.bottomLeft,
                                                                                colors: [
                                                                                  Color(0xff2C3036),
                                                                                  Color(0xff1C1F22)
                                                                                ],
                                                                              ),
                                                                              border: Border.all(color: const Color(0xff000000).withOpacity(0.05), width: 2),
                                                                              boxShadow: [
                                                                                BoxShadow(color: const Color(0xff1F2427).withOpacity(0.8), blurRadius: 10, spreadRadius: 0, offset: const Offset(4, 4)),
                                                                                BoxShadow(color: const Color(0xff484E53).withOpacity(0.6), blurRadius: 10, spreadRadius: 0, offset: const Offset(-2, -4)),
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(20.0)),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.close,
                                                                              color: Colors.white.withOpacity(0.5),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ));
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            width: 1.0,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.2)),
                                                        bottom: BorderSide(
                                                            width: 1.0,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.2)))),
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                                gradient:
                                                                    const LinearGradient(
                                                                  begin: Alignment
                                                                      .topLeft,
                                                                  end: Alignment
                                                                      .bottomLeft,
                                                                  colors: [
                                                                    Color(
                                                                        0xff2C3036),
                                                                    Color(
                                                                        0xff1C1F22)
                                                                  ],
                                                                ),
                                                                border: Border.all(
                                                                    color: const Color(
                                                                            0xff000000)
                                                                        .withOpacity(
                                                                            0.05),
                                                                    width: 2),
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12.0),
                                                          child: Image.asset(
                                                            "assets/Add_Categories/wallet.png",
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      const CommonText(
                                                          text: "Cash Wallet",
                                                          size: 16.0,
                                                          weight:
                                                              FontWeight.w500,
                                                          color: Colors.white),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              onTap: () {
                                                _selectDate(context);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 1.0,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.2)))),
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                                gradient:
                                                                    const LinearGradient(
                                                                  begin: Alignment
                                                                      .topLeft,
                                                                  end: Alignment
                                                                      .bottomLeft,
                                                                  colors: [
                                                                    Color(
                                                                        0xff2C3036),
                                                                    Color(
                                                                        0xff1C1F22)
                                                                  ],
                                                                ),
                                                                border: Border.all(
                                                                    color: const Color(
                                                                            0xff000000)
                                                                        .withOpacity(
                                                                            0.05),
                                                                    width: 2),
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12.0),
                                                          child: Image.asset(
                                                            "assets/Add_Categories/calendar.png",
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      CommonText(
                                                          text:
                                                              "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                                                          size: 16.0,
                                                          weight:
                                                              FontWeight.w500,
                                                          color: Colors.white),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                                gradient:
                                                                    const LinearGradient(
                                                                  begin: Alignment
                                                                      .topLeft,
                                                                  end: Alignment
                                                                      .bottomLeft,
                                                                  colors: [
                                                                    Color(
                                                                        0xff2C3036),
                                                                    Color(
                                                                        0xff1C1F22)
                                                                  ],
                                                                ),
                                                                border: Border.all(
                                                                    color: const Color(
                                                                            0xff000000)
                                                                        .withOpacity(
                                                                            0.05),
                                                                    width: 2),
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12.0),
                                                          child: Image.asset(
                                                            "assets/Add_Categories/tag.png",
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      const CommonText(
                                                          // text: widget.categoryName.toString(),
                                                          text: "(Vacation)",
                                                          size: 16.0,
                                                          weight:
                                                              FontWeight.w500,
                                                          color: Colors.white),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              InkWell(
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
                                      child: Container(
                                        decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                Color(0xff2C3036),
                                                Color(0xff1C1F22)
                                              ],
                                            ),
                                            border: Border.all(
                                                color: const Color(0xff000000)
                                                    .withOpacity(0.05),
                                                width: 2),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: const Color(0xff1F2427)
                                                      .withOpacity(0.4),
                                                  // color: Colors.red.withOpacity(0.8),
                                                  blurRadius: 10,
                                                  spreadRadius: 0,
                                                  offset: const Offset(4, 4)),
                                              BoxShadow(
                                                  color: const Color(0xff484E53)
                                                      .withOpacity(0.2),
                                                  // color: Colors.yellow.withOpacity(0.6),
                                                  blurRadius: 10,
                                                  spreadRadius: 0,
                                                  offset: const Offset(-2, -4)),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        height: Get.height / 3.9,
                                        padding: const EdgeInsets.all(0.0),
                                        child: Stack(
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      CommonText(
                                                          text: "Select Photo",
                                                          size: 18.0,
                                                          weight:
                                                              FontWeight.w500,
                                                          color: Colors.white),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 30.0,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0),
                                                  child: Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          getImageFromCamera();
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const CommonText(
                                                                text:
                                                                    "Take Photo",
                                                                size: 18.0,
                                                                weight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .white),
                                                            const SizedBox(
                                                              width: 15.0,
                                                            ),
                                                            Image.asset(
                                                              "assets/Drawer/right_arrow.png",
                                                              width: 30.0,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 30.0,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          getImageFromGallery();
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const CommonText(
                                                                text:
                                                                    "Choose From Library",
                                                                size: 18.0,
                                                                weight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .white),
                                                            const SizedBox(
                                                              width: 15.0,
                                                            ),
                                                            Image.asset(
                                                              "assets/Drawer/right_arrow.png",
                                                              width: 30.0,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Align(
                                              alignment:
                                                  const Alignment(1.10, -1.10),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
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
                                                                    0.8),
                                                            blurRadius: 10,
                                                            spreadRadius: 0,
                                                            offset:
                                                                const Offset(
                                                                    4, 4)),
                                                        BoxShadow(
                                                            color: const Color(
                                                                    0xff484E53)
                                                                .withOpacity(
                                                                    0.6),
                                                            blurRadius: 10,
                                                            spreadRadius: 0,
                                                            offset:
                                                                const Offset(
                                                                    -2, -4)),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                      image: _image == null
                                          ? null
                                          : DecorationImage(
                                              image: FileImage(_image!),
                                              fit: BoxFit.cover),
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
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: _image == null
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
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
                                                          color: const Color(
                                                                  0xff000000)
                                                              .withOpacity(
                                                                  0.05),
                                                          width: 2),
                                                      shape: BoxShape.circle),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: Image.asset(
                                                      "assets/Add_Categories/gallery.png",
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                const CommonText(
                                                    text: "Select Photo",
                                                    size: 16.0,
                                                    weight: FontWeight.w500,
                                                    color: Colors.white),
                                              ],
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
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
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: TextFormField(
                                  maxLines: 4,
                                  controller: _noteController,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 16.0,
                                      fontFamily: "SpaceFont",
                                      fontWeight: FontWeight.w500),
                                  // cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 16.0,
                                        fontFamily: "SpaceFont",
                                        fontWeight: FontWeight.w500),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            color: const Color(0xff000000)
                                                .withOpacity(0.05),
                                            width: 2)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            color: const Color(0xff000000)
                                                .withOpacity(0.05),
                                            width: 2)),
                                    hintText: "Write a note",
                                    // focusColor: Colors.white,
                                    fillColor: Colors.transparent,
                                    filled: true,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonAppBarOnlyLeftArrow(
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            text: "Add ${widget.data.title}"),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 20.0, left: 20.0, right: 20.0),
                          child: InkWell(
                            onTap: () {
                              if (_currentValue == 0) {
                                Fluttertoast.showToast(
                                    msg: "Please Enter Amount");
                              } else {
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  saveCategory();
                                  isLoading = false;
                                } catch (e) {
                                  Fluttertoast.showToast(msg: "$e");
                                } finally {
                                  setState(() {
                                    isLoading = true;
                                  });
                                }
                              }
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
                                    width: 2.0, color: const Color(0xff11A8FD)),
                                borderRadius: BorderRadius.circular(15.0),
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
                                  child: isLoading
                                      ? CommonCircularIndicator()
                                      : CommonText(
                                          text: "Add Transaction",
                                          size: 16.0,
                                          weight: FontWeight.w700,
                                          color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  void saveCategory() {
    String? mainCategory = widget.data.title;
    String icon = widget.data.icon.toString();
    String amount = _currentValue.toString();
    String note = _noteController.text;

    String categoryName = "Income";
    String date =
        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";

    Map<void, void> contact = {
      'mainCategory': mainCategory,
      'icon': icon,
      'amount': amount,
      'note': note,
      'categoryName': categoryName,
      'date': date,
      'image': _image == null ? "" : base64Encode(_image!.readAsBytesSync()),
    };

    _reference
        .child("$getUId")
        .child("Wallet")
        .child("IncomeExpenseData")
        .push()
        .set(contact)
        .then((value) {
      Navigator.pop(context);
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
