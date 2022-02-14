import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

const apiKey = '54e37211279839b19ac550a79be411e2';
const openweatherurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var cityUrl = '$openweatherurl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: cityUrl);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.determinePosition();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openweatherurl?lat=${location.latitute}&lon=${location.longtitute}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String weatherText(int condition) {
    if (condition >= 200 && condition < 300) {
      return 'Thunderstorm';
    } else if (condition >= 300 && condition < 400) {
      return 'Drizzle';
    } else if (condition >= 400 && condition < 600) {
      return 'Rain';
    } else if (condition >= 600 && condition < 700) {
      return 'Snow';
    } else if (condition >= 700 && condition < 800) {
      return 'Haze';
    } else if (condition == 800) {
      return 'Clear Sky';
    } else if (condition > 800 && condition < 900) {
      return 'Clouds';
    } else {
      return 'Clear';
    }
  }

  String weatherIcon(int condition) {
    if (condition >= 200 && condition < 300) {
      return 'assets/images/17.png';
    } else if (condition >= 300 && condition < 400) {
      return 'assets/images/7.png';
    } else if (condition >= 400 && condition < 600) {
      return 'assets/images/8.png';
    } else if (condition >= 600 && condition < 700) {
      return 'assets/images/36.png';
    } else if (condition >= 700 && condition < 800) {
      return 'assets/images/23.png';
    } else if (condition == 800) {
      return 'assets/images/26.png';
    } else if (condition > 800 && condition < 900) {
      return 'assets/images/35.png';
    } else {
      return 'assets/images/26.png';
    }
  }
}

class UpdateUi {
  WeatherModel weatherModel = WeatherModel();
  late int temp;
  late String weatherText;
  late String iconUrl;
  late String cityName;
  late int humidity;
  late double windSpeed;
  late int clouds;

  void updateUi(dynamic weatherData) {
    double tempdouble = weatherData['main']['temp'];
    temp = tempdouble.toInt();
    int condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
    humidity = weatherData['main']['humidity'];
    double wind = weatherData['wind']['speed'];
    windSpeed = double.parse(((wind / 1000) * 3600).toStringAsFixed(2));
    clouds = weatherData['clouds']['all'];
    weatherText = weatherModel.weatherText(condition);
    iconUrl = weatherModel.weatherIcon(condition);
  }
}
