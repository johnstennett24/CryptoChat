// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:crypto_web_app/DataServices.dart';

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
  State<CryptoChart> createState() => _CryptoChartState();
  String currency;
}

class _CryptoChartState extends State<CryptoChart> {
  DataServices ds = DataServices();
  List<double> prices = [];

  _CryptoChartState() {
    ds.getHistory(widget.currency).then((value) => handleData(value));
  }

  void handleData(Map<String, dynamic> data) {
    setState(
      () {
        prices = ds.convertToList(data, "price", 1);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //var data = ds.getData(widget.currency, ds.getDate());

    BoxDecoration myBoxDecoration() {
      return BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26.withOpacity(0.5)),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: myBoxDecoration(),
        width: 200,
        height: 200,
        child: SfSparkLineChart(
          data: prices,
          color: Colors.blue,
          axisLineWidth: 2.0,
        ),
      ),
    );
  }
}
