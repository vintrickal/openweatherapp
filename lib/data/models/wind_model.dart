import 'package:openweatherapp/domain/entities/wind_entities.dart';
import 'package:equatable/equatable.dart';

class WindModel extends WindEntities with EquatableMixin {
  WindModel({
    required super.speed,
    required super.deg,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: json['speed'],
      deg: json['deg'],
    );
  }
}
