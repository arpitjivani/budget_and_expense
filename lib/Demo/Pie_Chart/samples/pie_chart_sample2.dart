import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'indicator.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.4,
      child: Row(
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xff2C3036), Color(0xff1C1F22)],
                      ),
                      border: Border.all(
                          color: const Color(0xff000000).withOpacity(0.05),
                          width: 2),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xff1F2427).withOpacity(0.8),
                            // color: Colors.red.withOpacity(0.8),
                            blurRadius: 5,
                            spreadRadius: 0,
                            offset: const Offset(4, 4)),
                        BoxShadow(
                            color: const Color(0xff484E53).withOpacity(0.6),
                            // color: Colors.yellow.withOpacity(0.6),
                            blurRadius: 5,
                            spreadRadius: 0,
                            offset: const Offset(-2, -4)),
                      ],
                      shape: BoxShape.circle),
                  child: PieChart(
                    PieChartData(
                        pieTouchData: PieTouchData(touchCallback:
                            (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        }),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 5,
                        centerSpaceRadius: 45,
                        sections: showingSections()),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Indicator(
                    color: Color(0xff28B2FF),
                    text: '48.9%',
                    isSquare: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Indicator(
                    color: Color(0xffFFA05C),
                    text: '24.7%',
                    isSquare: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Indicator(
                    color: Color(0xff3EF190),
                    text: '16.2%',
                    isSquare: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Indicator(
                    color: Color(0xffC21FEE),
                    text: '10.2%',
                    isSquare: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Indicator(
                    color: Color(0xff28B2FF),
                    text: '48.9%',
                    isSquare: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Indicator(
                    color: Color(0xffFFA05C),
                    text: '24.7%',
                    isSquare: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Indicator(
                    color: Color(0xff3EF190),
                    text: '16.2%',
                    isSquare: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Indicator(
                    color: Color(0xffC21FEE),
                    text: '10.2%',
                    isSquare: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Indicator(
                    color: Color(0xff28B2FF),
                    text: '48.9%',
                    isSquare: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Indicator(
                    color: Color(0xffFFA05C),
                    text: '24.7%',
                    isSquare: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Indicator(
                    color: Color(0xff3EF190),
                    text: '16.2%',
                    isSquare: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Indicator(
                    color: Color(0xffC21FEE),
                    text: '10.2%',
                    isSquare: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff28B2FF),
            value: 48.8,
            title: '48.8%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xffFFA05C),
            value: 24.7,
            title: '24.7',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xffC21FEE),
            value: 10.2,
            title: '10.2%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 16.2,
            title: '16.2%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
