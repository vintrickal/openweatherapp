// ignore_for_file: must_be_immutable

part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class LoadingWeatherData extends WeatherState {}

final class Error extends WeatherState {
  final String message;
  Error({required this.message});

  List<Object?> get props => [message];
}

class LoadedWeatherPayload extends WeatherState {
  final WholeWeatherModel model;

  LoadedWeatherPayload({
    required this.model,
  });
}

class SetWeatherBG extends WeatherState {
  final String weatherPath;

  SetWeatherBG({
    required this.weatherPath,
  });
}
