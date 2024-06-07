import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '/model/chart_data.dart';

class SalesChart extends StatelessWidget {
  final List<ChartData> data = [
    ChartData(1, 0),
    ChartData(2, 1),
    ChartData(3, 1),
    ChartData(4, 1),
    ChartData(5, 2),
    ChartData(6, 3),
  ];

  final List<DonutData> donutData = [
    DonutData('Pendapatan', 775000),
    DonutData('Keuntungan', 267700),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartData, int>> series = [
      charts.Series(
        id: 'Sales',
        data: data,
        domainFn: (ChartData sales, _) => sales.day,
        measureFn: (ChartData sales, _) => sales.value,
      )
    ];

    List<charts.Series<DonutData, String>> donutSeries = [
      charts.Series(
        id: 'Donut',
        data: donutData,
        domainFn: (DonutData donut, _) => donut.category,
        measureFn: (DonutData donut, _) => donut.value,
        labelAccessorFn: (DonutData row, _) => '${row.category}: ${row.value}',
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Penjualan Bulan Ini'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              padding: EdgeInsets.all(16.0),
              child: charts.LineChart(series, animate: true),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Jml Transaksi',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('3'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Pendapatan',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Rp 775.000'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Keuntungan',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Rp 267.700'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              padding: EdgeInsets.all(16.0),
              child: charts.PieChart(
                donutSeries,
                animate: true,
                defaultRenderer: charts.ArcRendererConfig(
                  arcWidth: 60,
                  arcRendererDecorators: [
                    charts.ArcLabelDecorator(
                      labelPosition: charts.ArcLabelPosition.inside,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
