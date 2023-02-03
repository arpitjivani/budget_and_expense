import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_scaffold.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

class EditWallet extends StatefulWidget {
  const EditWallet({Key? key}) : super(key: key);

  @override
  State<EditWallet> createState() => _EditWalletState();
}

class _EditWalletState extends State<EditWallet> {
  final TextEditingController _walletNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  double? _currentValue = 0;

  late DatabaseReference _reference;

  String? getUId;

  void getEmailToStorage() async {
    getUId = await getStringFromLocalStorage(KEY_USER_UID);
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
                                        child: Image.asset("assets/close.png",
                                            color: const Color(0xff7F8489)),
                                      )),
                                ),
                                const CommonText(
                                    text: "Edit Cash Wallet",
                                    size: 18.0,
                                    weight: FontWeight.w500,
                                    color: Colors.white),
                                InkWell(
                                  onTap: () {
                                    deleteWallet();
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
                                        child: Image.asset("assets/delete.png",
                                            color: const Color(0xff7F8489)),
                                      )),
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
                                            hintText: "Wallet Name",
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
                                          "assets/WalletPage/wallet.png"),
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
                                            hintText: "Visible Categories",
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
                                      child: Image.asset("assets/category.png"),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: InkWell(
                        onTap: () {
                          editProfile();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color(0xff000000).withOpacity(0.5),
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
                              colors: [Color(0xff0160A5), Color(0xff11A7FC)],
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 13.0),
                              child: CommonText(
                                  text: "Save Changes",
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
              )),
        ),
      ),
    );
  }

  deleteWallet() {
    _reference.child("$getUId").child("Wallet").remove().then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  void editProfile() async {
    String editWalletName = _walletNameController.text;

    Map<String, dynamic> contact = {
      'walletName': editWalletName,
    };

    _reference.child("$getUId").child("Wallet").update(contact).then((value) {
      Navigator.pop(context, true);
      setState(() {});
    });
  }
}
