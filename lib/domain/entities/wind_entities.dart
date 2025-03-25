import 'package:equatable/equatable.dart';

class WindEntities extends Equatable {
  final double speed;
  final int deg;

  const WindEntities({
    required this.speed,
    required this.deg,
  });

  @override
  List<Object?> get props => [
        speed,
        deg,
      ];
}
