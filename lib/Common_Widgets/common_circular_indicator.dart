import 'package:flutter/material.dart';

class CommonCircularIndicator extends StatefulWidget {
  const CommonCircularIndicator({Key? key}) : super(key: key);

  @override
  State<CommonCircularIndicator> createState() =>
      _CommonCircularIndicatorState();
}

class _CommonCircularIndicatorState extends State<CommonCircularIndicator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2.5,));
  }
}
