import 'package:openweatherapp/data/models/cloud_model.dart';
import 'package:openweatherapp/data/models/coord_model.dart';
import 'package:openweatherapp/data/models/main_model.dart';
import 'package:openweatherapp/data/models/sys_model.dart';
import 'package:openweatherapp/data/models/weather_model.dart';
import 'package:openweatherapp/data/models/wind_model.dart';
import 'package:openweatherapp/domain/entities/whole_weather_entities.dart';
import 'package:equatable/equatable.dart';

class WholeWeatherModel extends WholeWeatherEntities with EquatableMixin {
  WholeWeatherModel({
    super.coord,
    super.weather,
    super.base,
    super.main,
    super.visibility,
    super.wind,
    super.clouds,
    super.dt,
    super.sys,
    super.timezone,
    super.id,
    super.name,
    super.cod,
  });

  factory WholeWeatherModel.fromJson(Map<String, dynamic> json) {
    return WholeWeatherModel(
      coord: json['coord'] != null ? CoordModel.fromJson(json['coord']) : null,
      weather: json['weather'] != null
          ? (json['weather'] as List)
              .map((i) => WeatherModel.fromJson(i))
              .toList()
          : null,
      base: json['base'],
      main: json['main'] != null ? MainModel.fromJson(json['main']) : null,
      visibility: json['visibility'],
      wind: json['wind'] != null ? WindModel.fromJson(json['wind']) : null,
      clouds:
          json['clouds'] != null ? CloudModel.fromJson(json['clouds']) : null,
      dt: json['dt'],
      sys: json['sys'] != null ? SysModel.fromJson(json['sys']) : null,
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}
