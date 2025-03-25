import 'package:equatable/equatable.dart';
import 'package:openweatherapp/domain/entities/weather_entities.dart';

class WeatherModel extends WeatherEntities with EquatableMixin {
  WeatherModel({
    required super.id,
    required super.main,
    required super.description,
    required super.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
