import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/Pages/Home_page.dart';
import 'package:weather_app/Pages/search_page.dart';
import 'package:weather_app/services/weather_services.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(weather_services());
      },
      child: const Weather_App()));
}

// ignore: camel_case_types
class Weather_App extends StatelessWidget {
  const Weather_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          Search_page.id: (context) => Search_page(),
          HomePage.id: (context) => HomePage(),
        },
        theme: ThemeData(
            primarySwatch:
                BlocProvider.of<WeatherCubit>(context).weathermodels == null
                    ? Colors.yellow
                    : BlocProvider.of<WeatherCubit>(context)
                        .weathermodels!
                        .getThemeColors(),
            brightness: Brightness.light),
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.id);
  }
}
