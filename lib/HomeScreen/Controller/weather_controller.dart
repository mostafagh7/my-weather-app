import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/HomeScreen/Model/weather_model.dart';


class HomeController {
  String? cityName;
  String appId = "f71660332cef0561cde271e501606d22";
  String url = "https://api.openweathermap.org/data/2.5/weather";
  WeatherModel? model;
  bool isLoading=false;

  getWeather() async {
    String path = "$url?q=$cityName&appid=$appId";
    print(path);
    Response response = await Dio().get(path);
    if (response.statusCode == 200) {
    model=WeatherModel.fromJson(response.data);

    } else {
      Fluttertoast.showToast(msg: response.data.toString());
    }
  }

  updateCityName(String newValue) {
    cityName = newValue;
  }
  updateIsLoading(){
    isLoading=!isLoading;
  }
}
