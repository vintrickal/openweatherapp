import 'package:openweatherapp/domain/entities/cloud_entities.dart';
import 'package:equatable/equatable.dart';

class CloudModel extends CloudEntities with EquatableMixin {
  CloudModel({
    required super.all,
  });

  factory CloudModel.fromJson(Map<String, dynamic> json) {
    return CloudModel(
      all: json['all'],
    );
  }
}
