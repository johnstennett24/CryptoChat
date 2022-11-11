import 'dart:convert';
import 'package:http/http.dart' as http;

///
/// This class handles all the Get requests for the App.
///
class DataServices {
  /// getDate() returns the current date in time in
  /// the format of DD-MM-YYYY
  String getDate() {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);

    return "${date.day}-${date.month}-${date.year}";
  }

  /// The getHistory() returns a Map<String, dynamic> that is used to
  /// pull the history of the pricing and other information of a given
  /// Crypto Currency the return can be used to then access any of the
  /// other information that is given in the Json object.
  ///
  /// CoinGecko Swagger documentation: https://www.coingecko.com/en/api/documentation
  /// (Under GET/coins/{id}/market_chart)
  ///
  Future<Map<String, dynamic>> getHistory(String currency) async {
    var url = Uri.https(
      "api.coingecko.com",
      "api/v3/coins/$currency/market_charts",
      {"vs_currency": "usd", "days": "7", "interval": "5%20minutes"},
    );

    var response = await http.get(url);
    var data = await jsonDecode(response.body) as Map<String, dynamic>;
    return data;
  }

  /// convertToList() creates a list out of whatever you are looking for in the
  /// Map<String, dynamic> you returned from getHistory. This method takes three
  /// parameters. One is the Map<String, dynamic> that is returned from history or
  /// another method that returns a Map<String, dynamic>, a String key that is to be
  /// the key of the Map that you would like to read the values of the key into, and
  /// then the index of the thing in the list inside the key that you would like to
  /// add to the empty list.
  ///
  List<double> convertToList(Map<String, dynamic> data, String key, int index) {
    // Create an empty list
    List<double> listOfValues = [];
    // for loop to go through the values of the list that is the value of the
    // key
    for (var list in data[key]) {
      // adds the value of the index that you choose into the listOfValues
      listOfValues.add(list[index]);
    }
    return listOfValues;
  }

  /// getCurrentPrice() returns a Map<String, dynamic> that has the information of
  /// the Crypto Currency you want to look for. It takes one parameter "String crypto"
  /// which is meant to be the name of the Currency you are looking for.
  ///
  /// CoinGecko Swagger documentation: https://www.coingecko.com/en/api/documentation
  /// (Under GET/coins/{id})
  ///
  Future<Map<String, dynamic>> getCurrentPrice(String crypto) async {
    var url = Uri.https("api.coingecko.com", "api/v3/coins/$crypto");

    var response = await http.get(url);
    var data = await jsonDecode(response.body) as Map<String, dynamic>;
    return data;
  }
}
