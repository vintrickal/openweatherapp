import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:openweatherapp/application/core/services/status_code_service.dart';
import 'package:openweatherapp/data/API/api_endpoints.dart';
import 'package:openweatherapp/data/exceptions/exceptions.dart';
import 'package:openweatherapp/data/models/whole_weather_model.dart';

abstract class WeatherRemoteDatasource {
  Future<WholeWeatherModel> getWeatherPayLoad(double lat, double lon);
}

class WeatherRemoteDatasourceImpl implements WeatherRemoteDatasource {
  @override
  Future<WholeWeatherModel> getWeatherPayLoad(double lat, double lon) async {
    final String apiKey = dotenv.env['OPENWEATHER_API_KEY'] ?? '';
    Uri url = Uri.parse(
        '${APIEndpoints.weather}lat=$lat&lon=$lon&appid=$apiKey&units=metric');

    try {
      final response = await http.get(
        url,
      );

      int statusCode = response.statusCode;
      bool status = statusCodeChecker(statusCode, response.body);

      if (status) {
        final responseBody = json.decode(response.body);
        var payload = WholeWeatherModel.fromJson(responseBody);
        return payload;
      } else {
        throw ServerException500();
      }
    } catch (e) {
      throw GeneralException();
    }
  }
}
