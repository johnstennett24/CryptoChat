// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:crypto_web_app/data/DataServices.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:crypto_web_app/models/CryptoPrice.dart';

/// CryptoChart is a Stateful widget that returns a Container that has a
/// Syncfusion line chart that is imported from the Syncfusion Library
/// (https://www.syncfusion.com/). The widget takes a parameter that is a String
/// called currency that is used to get the name or id of the currency the developer
/// would like to see. The Chart uses data from the DataServices class
/// and takes a list of numbers to show the data as points on the chart.
///

class CryptoChart extends StatefulWidget {
  CryptoChart({Key? key, required this.currency}) : super(key: key);

  @override
  State<CryptoChart> createState() => _CryptoChartState(currency);
  String currency;
}

class _CryptoChartState extends State<CryptoChart> {
  DataServices ds = DataServices();
  List<CryptoPrice> prices = [];

  _CryptoChartState(String currency) {
    ds.getMarketCharts(currency).then((value) => handleData(value));
  }

  void handleData(Map<String, dynamic> data) {
    setState(
      () {
        prices = ds.addToList(data, "prices");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration myBoxDecoration() {
      return BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26.withOpacity(0.5)),
        ],
      );
    }

    child:
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: myBoxDecoration(),
      width: 500,
      height: 500,
      child: Row(
        children: [
          Text(widget.currency),
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries>[
              LineSeries<CryptoPrice, int>(
                dataSource: prices,
                xValueMapper: (CryptoPrice data, _) => data.time,
                yValueMapper: (CryptoPrice data, _) => data.price,
              )
            ],
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
