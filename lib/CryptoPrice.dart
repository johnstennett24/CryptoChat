/// This class is used for storing prices and the time associated
/// with that price from the API. The DataServices class has a method
/// getMarketCharts and addToList. They are meant to be used together.
/// getMarketCharts returns a Map<String, dynamic> and one of the keys of
/// that map is "prices", the value is a list of lists of prices at index of 1
/// and time at index of 0, the addToList method creates and returns a list of
/// type CryptoPrice that then is used in the CryptoChart widget as the x
/// and y values for each data point.

class CryptoPrice {
  CryptoPrice(this.time, this.price);
  final int time;
  final double price;
}
