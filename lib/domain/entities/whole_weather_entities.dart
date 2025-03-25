import 'package:equatable/equatable.dart';
import 'package:openweatherapp/data/models/cloud_model.dart';
import 'package:openweatherapp/data/models/coord_model.dart';
import 'package:openweatherapp/data/models/main_model.dart';
import 'package:openweatherapp/data/models/sys_model.dart';
import 'package:openweatherapp/data/models/weather_model.dart';
import 'package:openweatherapp/data/models/wind_model.dart';

class WholeWeatherEntities extends Equatable {
  final CoordModel? coord;
  final List<WeatherModel>? weather;
  final String? base;
  final MainModel? main;
  final int? visibility;
  final WindModel? wind;
  final CloudModel? clouds;
  final int? dt;
  final SysModel? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  const WholeWeatherEntities({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  @override
  List<Object?> get props => [
        coord,
        weather,
        base,
        main,
        visibility,
        wind,
        clouds,
        dt,
        sys,
        timezone,
        id,
        name,
        cod,
      ];
}
