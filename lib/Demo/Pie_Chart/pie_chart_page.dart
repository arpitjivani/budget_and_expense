import 'package:flutter/material.dart';
import 'samples/pie_chart_sample1.dart';
import 'samples/pie_chart_sample2.dart';
import 'samples/pie_chart_sample3.dart';

class PieChartPage extends StatelessWidget {
  final Color barColor = Colors.white;
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final double width = 22;

  const PieChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffeceaeb),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: ListView(
            children: const <Widget>[
              PieChartSample1(),
              SizedBox(
                height: 12,
              ),
              PieChartSample2(),
              SizedBox(
                height: 12,
              ),
              PieChartSample3(),
            ],
          ),
        ),
      ),
    );
  }
}
