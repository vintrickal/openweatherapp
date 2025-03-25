import 'package:equatable/equatable.dart';

class SysEntities extends Equatable {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  const SysEntities({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object?> get props => [
        type,
        id,
        country,
        sunrise,
        sunset,
      ];
}
