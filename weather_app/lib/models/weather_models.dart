// ignore: camel_case_types
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Weather_Models {
  
  String date;
  double temp;
  double maxTemp;
  double minTepm;
  String weatherStateaName;

  Weather_Models(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTepm,
      required this.weatherStateaName});

  factory Weather_Models.fromjson(dynamic data) {
    var jsondata = data['forecast']['forecastday'][0]['day'];
    return Weather_Models(
      date: data['location']['localtime'],
      temp: jsondata['avgtemp_c'],
      maxTemp: jsondata['maxtemp_c'],
      minTepm: jsondata['mintemp_c'],
      weatherStateaName: jsondata['condition']['text'],
    );
  }

  String getImage() {
    if (weatherStateaName == 'Clear' ||
        weatherStateaName == 'Light cloud' ||
        weatherStateaName == 'Sunny') {
      return 'assets/images/clear.png';
    } else if (weatherStateaName == 'Sleet' ||
        weatherStateaName == 'Patchy snow nearby' ||
        weatherStateaName == 'Patchy freezing drizzle nearby') {
      return 'assets/images/snow.png';
    } else if (weatherStateaName == 'Partly Cloudy' ||
        weatherStateaName == 'Cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateaName == 'Patchy rain nearby' ||
        weatherStateaName == 'Patchy rain possible') {
      return 'assets/images/rainy.png';
    } else if (weatherStateaName == 'Thunderstorm' ||
        weatherStateaName == 'Thunder' ||
        weatherStateaName == 'Overcast' ||
        weatherStateaName == 'Patchy sleet nearby' ||
        weatherStateaName == 'Thundery outbreaks in nearby') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColors() {
    if (weatherStateaName == 'Clear' ||
        weatherStateaName == 'Light cloud' ||
        weatherStateaName == 'Sunny') {
      return Colors.orange;
    } else if (weatherStateaName == 'Sleet' ||
        weatherStateaName == 'Patchy snow nearby' ||
        weatherStateaName == 'Patchy freezing drizzle nearby') {
      return Colors.blue;
    } else if (weatherStateaName == 'Partly Cloudy' ||
        weatherStateaName == 'Cloudy') {
      return Colors.grey;
    } else if (weatherStateaName == 'Patchy rain nearby' ||
        weatherStateaName == 'Patchy rain possible') {
      return Colors.blue;
    } else if (weatherStateaName == 'Thunderstorm' ||
        weatherStateaName == 'Thunder' ||
        weatherStateaName == 'Overcast' ||
        weatherStateaName == 'Patchy sleet nearby' ||
        weatherStateaName == 'Thundery outbreaks in nearby') {
      return Colors.brown;
    } else {
      return Colors.cyan;
    }
  }
  
}
