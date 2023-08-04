import 'package:flutter/material.dart';
import 'package:crypto_web_app/views/HomePage.dart';

/// Welcome to CryptoChat! This app is an experiment using the CoinGecko
/// API(CoinGecko Swagger documentation: https://www.coingecko.com/en/api/documentation),
/// to get current data on CryptoCurrencies and then eventually be able to chat with
/// friends about different CryptoCurrencies and what is happening in the world.
///

// Main function
void main() {
  runApp(const MyApp());
}

// The MyApp widget sets the home as the HomePage widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
