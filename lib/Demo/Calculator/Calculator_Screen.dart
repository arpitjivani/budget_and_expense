import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

class CalcButton extends StatefulWidget {
  const CalcButton({Key? key}) : super(key: key);

  @override
  _CalcButtonState createState() => _CalcButtonState();
}

class _CalcButtonState extends State<CalcButton> {
  double? _currentValue = 0;

  @override
  Widget build(BuildContext context) {
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
    return OutlinedButton(
      child: Text(_currentValue.toString()),
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xff2C3036), Color(0xff1C1F22)],
                    ),
                    border: Border.all(color: const Color(0xff000000).withOpacity(0.05),width: 2),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff1F2427).withOpacity(0.8),
                          // color: Colors.red.withOpacity(0.8),
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: const Offset(4, 4)),
                      BoxShadow(
                          color: const Color(0xff484E53).withOpacity(0.6),
                          // color: Colors.yellow.withOpacity(0.6),
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: const Offset(-2, -4)),
                    ],
                ),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.50,
                    child: calc),
              );
            });
      },
    );
  }
}
