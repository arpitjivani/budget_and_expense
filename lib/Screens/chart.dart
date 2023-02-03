import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChartWithSecondaryAxis extends StatelessWidget {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  final List<charts.Series<dynamic, String>> seriesList;
  final bool? animate;

  BarChartWithSecondaryAxis(this.seriesList, {this.animate});

  factory BarChartWithSecondaryAxis.withSampleData({required data, required data2}) {
    return BarChartWithSecondaryAxis(
      _createSampleData(data,data2),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      vertical: true,
      defaultRenderer: charts.BarRendererConfig(
        maxBarWidthPx: 40,
      ),
      barGroupingType: charts.BarGroupingType.grouped,
      primaryMeasureAxis: charts.NumericAxisSpec(
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(desiredTickCount: 5)),
      secondaryMeasureAxis: charts.NumericAxisSpec(
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(desiredTickCount: 5)),
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData(data, data2) {


    final Expense = <OrdinalSales>[
      OrdinalSales('1/22', 10),
      OrdinalSales('2/22', 20),
      OrdinalSales('3/22', 30),
      OrdinalSales('4/22', 40),
      OrdinalSales('5/22', data2),
    ];

    final Income = <OrdinalSales>[
      OrdinalSales('1/22', 10),
      OrdinalSales('2/22', 20),
      OrdinalSales('3/22', 30),
      OrdinalSales('4/22', 40),
      OrdinalSales('5/22', data),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Income',
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: Income,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Expense',
        areaColorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: Expense,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      )..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId)
    ];
  }
}

class OrdinalSales {
  final String month;
  final dynamic sales;

  OrdinalSales(this.month, this.sales);
}




