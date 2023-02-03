import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_text.dart';
import 'package:spendee_budget_and_expense/Common_Widgets/common_textfield.dart';

class TestIn extends StatefulWidget {
  const TestIn({Key? key}) : super(key: key);

  @override
  State<TestIn> createState() => _TestInState();
}

class _TestInState extends State<TestIn> {
  late TextEditingController _testController2 = TextEditingController();
  late DatabaseReference _referenceLabelsNew;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _referenceLabelsNew = FirebaseDatabase.instance.ref().child('DemoTree');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
              color: Colors.purple,
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
                builder: (context) => Test2(),
              ));
            },
            child: Container(
              color: Colors.purple,
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
    );
  }

  void saveLabelsNew() {
    String testName = _testController2.text;

    Map<void, void> contact = {
      'TestName': testName,
    };

    // _referenceLabels.push().set(contact).then((value) {
    //   Fluttertoast.showToast(msg: "Data Enter Successfully");
    // });

    // _referenceLabelsNew.child("Test In").set(contact).then((value){
    //   Fluttertoast.showToast(msg: "Data Enter Successfully");
    // });

    _referenceLabelsNew.child("Home").set(contact).then(
      (value) {
        Fluttertoast.showToast(msg: "Data Enter Successfully");
      },
    );
  }
}

class Test2 extends StatefulWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  late TextEditingController _testController2 = TextEditingController();
  late DatabaseReference _referenceLabelsNew;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _referenceLabelsNew = FirebaseDatabase.instance.ref().child('DemoTree');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
              color: Colors.purple,
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
        ],
      ),
    );
  }

  void saveLabelsNew() {
    String testName = _testController2.text;

    Map<void, void> contact = {
      'TestName': testName,
      'sahil':{
        'name':"sahil1",
      },
    };

    _referenceLabelsNew.push().set(contact).then((value) {
      Fluttertoast.showToast(msg: "Data Enter Successfully");
    });
  }
}
