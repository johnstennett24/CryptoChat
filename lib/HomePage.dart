import 'package:flutter/material.dart';
import 'package:crypto_web_app/CryptoChart.dart';
import 'package:crypto_web_app/CurrentPrice.dart';

/// This is the HomePage widget that will show when the app is started.
/// The HomePage is a stateful widget that shows the other two widgets
/// that are contained in this project, CryptoChart and CurrentPrice, which are
/// also stateful widgets that use the DataServices class to make Http requests on the
/// CoinGecko api(CoinGecko Swagger documentation: https://www.coingecko.com/en/api/documentation)
///
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("CryptoChat"),
        actions: [
          SizedBox(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Search"),
                  Icon(Icons.search),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      CryptoChart(currency: "bitcoin"),
                      CryptoChart(currency: "ethereum"),
                      CryptoChart(currency: "dogecoin"),
                      CryptoChart(currency: "shiba-inu"),
                      CryptoChart(currency: "usd-coin"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CurrentPrice(name: "bitcoin"),
                        CurrentPrice(name: "ethereum"),
                        CurrentPrice(name: "shiba-inu"),
                        CurrentPrice(name: "dogecoin"),
                        CurrentPrice(name: "usd-coin"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
