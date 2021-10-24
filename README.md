# A project to help learn Cubit/Bloc from scratch

## Flutter states architecture workflow

The user types in the city and taps get weather. Currently everything is happening within the presentation layer
When the user presses the getWeather button, it triggers the GetWeatherEvent() is dispatched to the weather bloc.The WeatherBloc knows that it should emit a loading state to the user to let him know that it is working on its request.

Inside the weather bloc, there is a dependency on the weather provider which can be accessed and with the help of which the getWeather for location will be called asynchronously because we dont know when the data will come back.

Inside the weather repository, there is a dependency for the weather API data provider with the help of which, we will call the getRawWeather() for location of the city. Inside the getWetaher, there will be a http.get request towards another API like AccuWeather that will receive the request and then send back a JSON string full of the request data. 

The RawWeatherData is then sent back to the weather repository, parsed into the weather model, then parsed back into the bloc. The bloc then emits a new state called WeatherLoaded() which it will send the weather model object as an attribute towards the presentation layer. The presentation layer with the help of BlocBuilder will exit the loading state and rebuild the UI with the new weather data marking the end of the workflow.

