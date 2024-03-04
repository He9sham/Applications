// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/Cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/Pages/search_page.dart';
import 'package:weather_app/models/weather_models.dart';

class HomePage extends StatelessWidget {
  static String id = 'home page';
  @override
  Widget build(BuildContext context) {
    Weather_Models? weatherdata;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: weatherdata!.getThemeColors(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Search_page.id);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            weatherdata = BlocProvider.of<WeatherCubit>(context).weathermodels;
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  weatherdata!.getThemeColors(),
                  weatherdata!.getThemeColors()[300]!,
                  weatherdata!.getThemeColors()[100]!
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    BlocProvider.of<WeatherCubit>(context).cityname!,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Update : ${weatherdata!.date.toString()}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherdata!.getImage()),
                      Text(
                        '${weatherdata!.temp.toInt()}',
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text('Min-temp : ${weatherdata!.minTepm.toInt()}'),
                          Text('max-temp : ${weatherdata!.maxTemp.toInt()}')
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    weatherdata!.weatherStateaName,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            );
          } else if (state is WeatherFailure) {
            return const Center(
              child: Text('Somthing is wrong , please try agine'),
            );
          } else {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
