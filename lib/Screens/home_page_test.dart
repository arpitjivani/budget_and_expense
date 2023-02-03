import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_textfield.dart';
import 'package:spendee_budget_and_expense/Screens/test_grid.dart';

class TestHome extends StatefulWidget {
  const TestHome({Key? key}) : super(key: key);

  @override
  State<TestHome> createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  late DatabaseReference _referenceLabels;
  late DatabaseReference _referenceLabelsNew;
  late TextEditingController _testController = TextEditingController();
  late TextEditingController _testController2 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _referenceLabels = FirebaseDatabase.instance.ref().child('DemoTree');
    _referenceLabelsNew = FirebaseDatabase.instance.ref().child('In');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo Firebase")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonTextField(
                text: "Demo Text",
                controller: _testController,
                keyboardType: TextInputType.text),
            SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                saveLabels();
              },
              child: Container(
                color: Colors.deepOrange,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: CommonText(
                      text: "Demo",
                      size: 20.0,
                      weight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
            CommonTextField(
                text: "Demo Text",
                controller: _testController2,
                keyboardType: TextInputType.text),
            SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                saveLabelsNew();
              },
              child: Container(
                color: Colors.deepOrange,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: CommonText(
                      text: "Demo",
                      size: 20.0,
                      weight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TestIn(),
                ));
              },
              child: Container(
                color: Colors.deepOrange,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: CommonText(
                      text: "Next",
                      size: 20.0,
                      weight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveLabels() {
    String testName = _testController.text;

    Map<void, void> contact = {
      'TestName': testName,
    };

    // _referenceLabels.push().set(contact).then((value) {
    //   Fluttertoast.showToast(msg: "Data Enter Successfully");
    // });

    _referenceLabels.child("Victor").set(contact).then((value) {
      Fluttertoast.showToast(msg: "Data Enter Successfully");
    });
  }

  void saveLabelsNew() {
    String testName = _testController2.text;

    Map<void, void> contact = {
      'TestName': testName,
    };

    // _referenceLabels.push().set(contact).then((value) {
    //   Fluttertoast.showToast(msg: "Data Enter Successfully");
    // });

    _referenceLabels.child("User1").set(contact).then((value) {
      Fluttertoast.showToast(msg: "Data Enter Successfully");
    });
  }
}
