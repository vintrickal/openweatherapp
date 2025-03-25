import 'package:equatable/equatable.dart';

class CloudEntities extends Equatable {
  final int all;

  const CloudEntities({
    required this.all,
  });

  @override
  List<Object?> get props => [
        all,
      ];
}
