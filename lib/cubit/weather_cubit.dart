import 'package:bloc/bloc.dart';
import 'package:fake_weather/bloc/weather_bloc.dart';
import 'package:fake_weather/data/model/weather.dart';
import 'package:fake_weather/data/weather_repository.dart';
import 'package:meta/meta.dart';


class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  //prepare for constructor wise dependency injection
  //pass weather repository instance to the weather cubit
  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  //returns void because we want to make sure that the method for getting weather can be asynchronous only  
  Future<void> getWeather(String cityName) async {
    try {
      //emit a state (weatherloading in this case)
      emit(WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(WeatherError("Couldn't fetch weather. Is the device online?"));
    }
  }
}