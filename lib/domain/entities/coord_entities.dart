import 'package:equatable/equatable.dart';

class CoordEntities extends Equatable {
  final double lon;
  final double lat;

  const CoordEntities({
    required this.lon,
    required this.lat,
  });

  @override
  List<Object?> get props => [
        lon,
        lat,
      ];
}
