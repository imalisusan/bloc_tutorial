import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fake_weather/bloc/weather_bloc.dart';
import 'package:fake_weather/cubit/weather_cubit.dart';
import 'package:fake_weather/data/weather_repository.dart';
import 'package:fake_weather/pages/weather_search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        //instatiate the weather cubit
        create: (context) => WeatherBloc(FakeWeatherRepository()),
        child: WeatherSearchPage(),
        // we can now acess the weather cubit throughout our whole weather search page  
      ),
    );
  }
}

//have a change notifier so whenever you change a state you trigger some action.
// You mutate that field in place to a new value and then you notify listeners in the case of a change.
class MyChnageNotifier extends ChangeNotifier{
  late int field1;
  late String field2;

  void changeState() {
    field2 = 'New Value';
    notifyListeners();
  }
}