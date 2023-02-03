import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  String state = 'Animation start';
  bool isRunning = true;

  @override
  Widget build(BuildContext context) {
    int totalAmount = 10000;
    double remainAmount = 1000;

    var completeAmount = totalAmount - remainAmount;

    var getPercentage = completeAmount * 100 / totalAmount;

    var getBarPercentage = getPercentage / 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Linear Percent Indicators"),
        actions: [
          IconButton(
              icon: const Icon(Icons.stop),
              onPressed: () {
                setState(() {
                  isRunning = false;
                });
              })
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "₹$remainAmount",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Left Out Of : ",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    "₹$totalAmount",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 1000,
                  percent: getBarPercentage,
                  animateFromLastPercent: true,
                  center: Text(
                    "${getPercentage.toStringAsFixed(2)}%",
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  // isRTL: true,
                  barRadius: const Radius.elliptical(5, 15),
                  // linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: const Color(0xffFFCC00),
                  maskFilter: const MaskFilter.blur(BlurStyle.solid, 3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
