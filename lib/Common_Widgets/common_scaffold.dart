import 'package:flutter/material.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';

class CommonScaffold extends StatefulWidget {
  final dynamic body;

  const CommonScaffold({Key? key, this.body}) : super(key: key);

  @override
  _CommonScaffoldState createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends State<CommonScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                child: widget.body),
          ),
        ),
      ),
    );
  }
}
