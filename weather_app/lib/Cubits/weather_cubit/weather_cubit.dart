import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_models.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherservices) : super(Weatherinitial());
  weather_services weatherservices;
  Weather_Models? weathermodels;
  String? cityname;
  void getweather({required String cityname}) async {
    emit(WeatherLoading());
    try {
      weathermodels = await weatherservices.getweather(cityname: cityname);
      emit(WeatherSuccess());
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
