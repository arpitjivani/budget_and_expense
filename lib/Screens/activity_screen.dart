import 'package:flutter/material.dart';
import 'package:spendee_budget_and_expense/utils/constant.dart';

class ActivityScreen extends StatelessWidget {
  final Function onNext;

  const ActivityScreen({Key? key, required this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainBG2,
      child: Center(
        child: MaterialButton(
          onPressed: () {
            onNext();
          },
          child: const Text('Go to next screen'),
          color: Colors.white,
        ),
      ),
    );
  }
}