import 'package:openweatherapp/domain/entities/coord_entities.dart';
import 'package:equatable/equatable.dart';

class CoordModel extends CoordEntities with EquatableMixin {
  CoordModel({
    required super.lon,
    required super.lat,
  });

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(
      lon: json['lon'],
      lat: json['lat'],
    );
  }
}
