import 'package:intl/intl.dart';

class WeatherModel {
  String location;
  String weatherIcon;
  String statusIcon;
  int temperature;
  int windSpeed;
  int humidity;
  int cloud;
  String currentDate;
  String sunset;
  String sunrise;
  String currentWeatherStatus;

  WeatherModel({
    required this.location,
    required this.weatherIcon,
    required this.statusIcon,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.cloud,
    required this.currentDate,
    required this.sunset,
    required this.sunrise,
    required this.currentWeatherStatus,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    var locationData = json["location"];
    var currentWeather = json["current"];
    var forecastWeather = json["forecast"];

    var currentDate =
        DateTime.parse(locationData["localtime"].substring(0, 10));
    var newDate = DateFormat('MMMMEEEEd').format(currentDate);

    var astroData = forecastWeather["forecastday"][0]["astro"];
    var sunrise = astroData["sunrise"];
    var sunset = astroData["sunset"];
    var targetDate = DateTime(2023, 10, 26);
    var currentDateTime = DateTime.now();
    if (!(currentDateTime.year == targetDate.year &&
        currentDateTime.month == targetDate.month &&
        currentDateTime.day == targetDate.day)) {
      sunrise = addHoursToTime(sunrise, 1);
      sunset = addHoursToTime(sunset, 1);
    }

    var currentWeatherStatus = currentWeather["condition"]["text"];
    var weatherIcon =
        currentWeatherStatus.replaceAll(' ', '').toLowerCase() + ".png";
    var statusIcon = currentWeather["condition"]["icon"];
    var temperature = currentWeather["temp_c"].toInt();
    var windSpeed = currentWeather["wind_kph"].toInt();
    var humidity = currentWeather["humidity"].toInt();
    var cloud = currentWeather["cloud"].toInt();

    return WeatherModel(
      location: locationData["name"],
      weatherIcon: weatherIcon,
      statusIcon: statusIcon,
      temperature: temperature,
      windSpeed: windSpeed,
      humidity: humidity,
      cloud: cloud,
      currentDate: newDate,
      sunset: sunset,
      sunrise: sunrise,
      currentWeatherStatus: currentWeatherStatus,
    );
  }
  static String addHoursToTime(String time, int hours) {
    var dateTime = DateFormat.jm().parse(time);
    var updatedDateTime = dateTime.add(Duration(hours: hours));
    return DateFormat.jm().format(updatedDateTime);
  }
}
