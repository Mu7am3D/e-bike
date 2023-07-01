import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  static String API_KEY =
      '75d0e61e6f0a4089a5231157230902'; //Paste Your API Here

  static String getWeatherAPI(String searchText) {
    return "https://api.weatherapi.com/v1/forecast.json?key=$API_KEY&days=7&q=$searchText";
  }

  static Future<Map<String, dynamic>> fetchWeatherData(
      String searchText) async {
    try {
      var searchResult = await http.get(Uri.parse(getWeatherAPI(searchText)));

      final weatherData = Map<String, dynamic>.from(
          json.decode(searchResult.body) ?? 'No data');

      return weatherData;
    } catch (e) {
      return {};
    }
  }
}
