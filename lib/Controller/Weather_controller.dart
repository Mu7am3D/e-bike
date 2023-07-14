import 'package:get/get.dart';
import '../Services/weather_api.dart';
import '../Models/Weather_model.dart';
import 'package:flutter/material.dart';

class WeatherController extends GetxController {
  var isOn = false;
  RxBool isLoading = false.obs;
  var location = 'Minya el Qamh'.obs; //Default location
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
    super.onInit();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showCityInputDialog(); // Show the alert dialog after the current frame is built
    });
    startLoading();
  }

  void showCityInputDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter City'),
          content: TextField(
            onChanged: (value) {
              // Update the location variable as the user types
              location.value = value;
            },
            decoration: InputDecoration(hintText: 'City Name'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                // Fetch weather data for the entered city
                fetchWeatherData(location.value);
                Get.back();
                update(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  void startLoading() {
    isLoading.value = true;
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }
}
