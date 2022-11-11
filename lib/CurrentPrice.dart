// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:crypto_web_app/DataServices.dart';

/// The CurrentPrice widget is a Stateful widget that will return a card of sorts that has the current
/// price of a given Crypto Currency. The widget takes one parameter of type
/// String name that is to be the id or name of the Crypto Currency.
///

class CurrentPrice extends StatefulWidget {
  CurrentPrice({Key? key, required this.name}) : super(key: key);

  @override
  State<CurrentPrice> createState() => _CurrentPriceState();
  String name;
}

class _CurrentPriceState extends State<CurrentPrice> {
  DataServices ds = DataServices();
  late String price;

  _CurrentPriceState() {
    ds.getCurrentPrice(widget.name).then((value) => handleData(value));
  }

  void handleData(Map<String, dynamic> data) {
    setState(() {
      if (data["market_data"]["current_price"]["usd"] == null) {
        price = "No Data";
      }
      price = data["market_data"]["current_price"]["usd"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black26,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3))
          ],
        ),
        height: 55,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(price),
          ],
        ),
      ),
    );
  }
}
