import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_models.dart';

// ignore: camel_case_types
class weather_services {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apikey = '8154e4199880496584015040240501';
  Future<Weather_Models> getweather({required String? cityname}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apikey&q=$cityname&days=7');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    Weather_Models weather = Weather_Models.fromjson(data);

    return weather;
  }
}
