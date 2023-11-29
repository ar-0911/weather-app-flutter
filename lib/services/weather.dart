import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = '{Your api key}';
const openWeatherurl = 'https://api.openweathermap.org/data/2.5/weather';
//const cityUrl = 'https://api.openweathermap.org/geo/1.0/reverse';
class WeatherModel {
  Location location = Location();

  Future<dynamic> getCityWeather(String cityName) async{
    String urlPath = '$openWeatherurl?q=$cityName&appid=$apikey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: urlPath,);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  Future<dynamic> getLocationWeather() async{
    await location.getCurrentLocation();
    String urlPath = '$openWeatherurl?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&exclude=minutely&units=metric';
    //String citypath = '$cityUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&limit=1';
    NetworkHelper networkHelper = NetworkHelper(url: urlPath,);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  // Future<String> getLocationCity() async{
  //   await location.getCurrentLocation();
  //   String urlPath = '$openWeatherurl?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&exclude=minutely&units=metric';
  //   String citypath = '$cityUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&limit=1';
  //   NetworkHelper networkHelper = NetworkHelper(url: urlPath,cityUrl: citypath);
  //   String cityName = await networkHelper.getCity();
  //   return cityName;
  // }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
