import 'package:get/get.dart';
import '../Services/weather_api.dart';
import '../Models/Weather_model.dart';

class WeatherController extends GetxController {
  var isOn = false;
  var location = 'Cairo'; //Default location
  var weatherModel = WeatherModel(
    location: '',
    weatherIcon: '',
    statusIcon: '',
    temperature: 0,
    windSpeed: 0,
    humidity: 0,
    cloud: 0,
    currentDate: '',
    sunset: '',
    sunrise: '',
    currentWeatherStatus: '',
  );

  void fetchWeatherData(String searchText) async {
    var weatherData = await WeatherApi.fetchWeatherData(searchText);
    weatherModel = WeatherModel.fromJson(weatherData);
    update(); // Notify GetBuilder to update the UI
  }

  @override
  void onInit() {
    fetchWeatherData(location);
    super.onInit();
  }

  void toggle() {
    isOn = !isOn;
    update();
  }
}
