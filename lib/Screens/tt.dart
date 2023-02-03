import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_add_button.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_dialog.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_scaffold.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Screens/Drawer_Sub_Screens/add_category_expense_drawer_screen.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';
import 'package:spendee_budget_and_expense/utils/secure_storage.dart';

class LabelScreen extends StatefulWidget {
  const LabelScreen({Key? key}) : super(key: key);

  @override
  _LabelScreenState createState() => _LabelScreenState();
}

class _LabelScreenState extends State<LabelScreen> {
  late DatabaseReference _reference;

  late final TextEditingController _labelController = TextEditingController();
  late final TextEditingController _labelEditController =
  TextEditingController();

  String? getUId;

  void getEmailToStorage() async {
    getUId = await getStringFromLocalStorage(KEY_USER_UID);
    _reference = FirebaseDatabase.instance.ref().child('UserData');
    getLabels();
    setState(() {});
  }

  @override
  void initState() {
    getEmailToStorage();
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    _labelController.dispose();
    super.dispose();
  }

  late DatabaseReference _ref;

  List<Map<dynamic, Labels>> addLabels = <Map<dynamic, Labels>>[
    {"": Labels(title: "Coffee")},
    {"": Labels(title: "Shopping")},
    {"": Labels(title: "Travelling")},
    {"": Labels(title: "Home")},
    {"": Labels(title: "Transport")},
  ];

  final List<Labels> list2 = [];
  List<Map<dynamic, Labels>> firebaseList = [];

  getLabels() async {
    print("getLabels -> ");

    var firebaseSnapshot =
    await FirebaseDatabase.instance.ref().child("Labels");

    firebaseSnapshot.onChildChanged.listen((event) {
      print("On value changed ${event.snapshot.key}");
      // firebaseList.add(values);
      firebaseList.forEach((Map element) {
        if (element.containsKey(event.snapshot.key)) {
          final user = Labels.fromJson(Map<String, dynamic>.from(
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
        .child("AddNewLabels")
        .get();
    firebaseList.addAll(addLabels);
    if (snapshot.value != null) {
      // correct
      list2.forEach((element) {
        print("addLabels -> ${element.title}");
      });
      Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;

      values.forEach((key, value) {
        print("LabelValue -> ${value.runtimeType}");
        final user = Labels.fromJson(Map<String, dynamic>.from(value));
        firebaseList.add({key: user});
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100.0,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          color: Colors.black.withOpacity(0.5),
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
                                  text: "Labels",
                                  size: 18.0,
                                  weight: FontWeight.w500,
                                  color: Colors.white),
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
                                          "assets/Drawer/merge.png",
                                          color: const Color(0xff7F8489)),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: firebaseList.length,
                            itemBuilder: (context, index) {
                              var exp2 = firebaseList[index].values.toList()[0];
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
                                    onTap: () {
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (BuildContext context) =>
                                      //       CommonDialogWithTextField(
                                      //     title: "Edit Labels",
                                      //     cancelButtonText: "Cancel",
                                      //     okButtonText: "ADD",
                                      //     okClick: () {
                                      //       editLabels();
                                      //       setState(() {});
                                      //     },
                                      //     cancelClick: () {
                                      //       Navigator.of(context).pop();
                                      //     },
                                      //     textFieldText: 'Label Name',
                                      //     keyboardType: TextInputType.text,
                                      //     controller: _labelController,
                                      //   ),
                                      // );



                                      // setState(() {
                                      //   Navigator.of(context)
                                      //       .push(MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         EditIncomeCategoriesDrawerScreen(
                                      //             data2: exp2,
                                      //             firebaseKey:
                                      //             firebaseList2[
                                      //             index]
                                      //                 .keys
                                      //                 .toList()[0]),
                                      //   ));
                                      //   if (selectingmode) {
                                      //     exp2.selected = !exp2.selected;
                                      //     log(exp2.selected.toString());
                                      //   }
                                      // });
                                    },
                                    title: CommonText(
                                        text: "${exp2.title}",
                                        size: 16.0,
                                        weight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              );
                            },
                          ),
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
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CommonDialogWithTextField(
                                  title: "Add New Label",
                                  cancelButtonText: "Cancel",
                                  okButtonText: "ADD",
                                  okClick: () {
                                    saveLabels();
                                    setState(() {});
                                  },
                                  cancelClick: () {
                                    Navigator.of(context).pop();
                                  },
                                  textFieldText: 'Label Name',
                                  keyboardType: TextInputType.text,
                                  controller: _labelController,
                                ),
                          );
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

  void saveLabels() {
    String labelName = _labelController.text;

    Map<void, void> contact = {
      'LabelName': labelName,
    };

    _reference
        .child("$getUId")
        .child("AddNewLabels")
        .child(labelName)
        .set(contact)
        .then((value) {
      Navigator.pop(context);
    });
  }

  void editLabels() {
    String LabelName = _labelEditController.toString();

    Map<String, String> contact = {
      'LabelName': LabelName,
    };

    _ref.child("UserData")
        .child("$getUId")
        .child("AddNewLabels")
        .child(_labelController.text)
        .update(contact)
        .then((value) {
      Navigator.pop(context, true);
    });
  }
}

class Labels {
  final String? title;

  Labels({
    this.title,
  });

  factory Labels.fromJson(Map<dynamic, dynamic> json) => Labels(
    title: json["LabelName"] ?? "",
  );
}
