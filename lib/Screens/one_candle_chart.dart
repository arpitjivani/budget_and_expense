import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ExpenseOneCandleBarChart extends StatefulWidget {
  final dynamic expenseData;

  const ExpenseOneCandleBarChart({Key? key, required this.expenseData})
      : super(key: key);

  @override
  _ExpenseOneCandleBarChartState createState() =>
      _ExpenseOneCandleBarChartState();
}

class _ExpenseOneCandleBarChartState extends State<ExpenseOneCandleBarChart> {
  @override
  Widget build(BuildContext context) {
    final List<EarningsTimeline> listEarnings = [
      EarningsTimeline(year: "08", earning: 18.5),
      EarningsTimeline(year: "09", earning: 21),
      EarningsTimeline(year: "10", earning: 30),
      EarningsTimeline(year: "11", earning: 38),
      EarningsTimeline(year: "12", earning: 42),
      EarningsTimeline(year: "13", earning: 43.5),
      EarningsTimeline(year: "14", earning: 73),
      EarningsTimeline(year: "15", earning: 79.6),
      EarningsTimeline(year: "16", earning: 82),
      EarningsTimeline(year: "17", earning: widget.expenseData),
    ];

    List<charts.Series<EarningsTimeline, String>> timeline = [
      charts.Series(
        id: "Subscribers",
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        data: listEarnings,
        domainFn: (EarningsTimeline timeline, _) => timeline.year,
        measureFn: (EarningsTimeline timeline, _) => timeline.earning,
      )
    ];

    return charts.BarChart(
      timeline,
      animate: true,
      primaryMeasureAxis: charts.NumericAxisSpec(
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(desiredTickCount: 5)),
    );
  }
}

class IncomeOneCandleBarChart extends StatefulWidget {
  final dynamic incomeData;

  const IncomeOneCandleBarChart({Key? key, required this.incomeData})
      : super(key: key);

  @override
  _IncomeOneCandleBarChartState createState() =>
      _IncomeOneCandleBarChartState();
}

class _IncomeOneCandleBarChartState extends State<IncomeOneCandleBarChart> {
  @override
  Widget build(BuildContext context) {
    final List<EarningsTimeline> listEarnings = [
      EarningsTimeline(year: "08", earning: 18.5),
      EarningsTimeline(year: "09", earning: 21),
      EarningsTimeline(year: "10", earning: 30),
      EarningsTimeline(year: "11", earning: 38),
      EarningsTimeline(year: "12", earning: 42),
      EarningsTimeline(year: "13", earning: 43.5),
      EarningsTimeline(year: "14", earning: 73),
      EarningsTimeline(year: "15", earning: 79.6),
      EarningsTimeline(year: "16", earning: 82),
      EarningsTimeline(year: "17", earning: widget.incomeData),
    ];

    List<charts.Series<EarningsTimeline, String>> timeline = [
      charts.Series(
        id: "Subscribers",
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        data: listEarnings,
        domainFn: (EarningsTimeline timeline, _) => timeline.year,
        measureFn: (EarningsTimeline timeline, _) => timeline.earning,
      )
    ];

    return charts.BarChart(
      timeline,
      animate: true,
      primaryMeasureAxis: charts.NumericAxisSpec(
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(desiredTickCount: 5)),
    );
  }
}

class EarningsTimeline {
  final String year;
  final dynamic earning;

  EarningsTimeline({
    required this.year,
    required this.earning,
  });
}
