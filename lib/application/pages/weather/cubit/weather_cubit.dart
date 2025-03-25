import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:openweatherapp/application/core/constants/constants.dart';
import 'package:openweatherapp/application/core/services/location_service.dart';
import 'package:openweatherapp/application/core/services/validation_service.dart';
import 'package:openweatherapp/data/models/whole_weather_model.dart';
import 'package:openweatherapp/domain/usecases/weather_usecases.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  final WeatherUsecases _weatherUsecases = WeatherUsecases();

  void onInitial() async {
    getUserLocation();
  }

  Future<void> getUserLocation() async {
    final failureOrSuccess = await requestPermission();
    failureOrSuccess.fold(
      (failure) => emit(Error(message: failure)),
      (success) async {
        LatLng latLng = await getLastKnownPosition();

        emit(LoadingWeatherData());
        await loadWeatherPayload(latLng.latitude, latLng.longitude);
      },
    );
  }

  Future<void> loadWeatherPayload(double lat, double lon) async {
    final failureOrSuccess = await _weatherUsecases.getWeatherPayLoad(lat, lon);

    failureOrSuccess.fold(
      (failure) => emit(Error(message: mapFailureToMessage(failure))),
      (payload) async {
        getWeatherBG(payload);
        emit(LoadedWeatherPayload(model: payload));
      },
    );
  }

  void getWeatherBG(WholeWeatherModel model) {
    String imagePath = '';
    int weatherId = model.weather![0].id;
    String weatherIcon = model.weather![0].icon;

    if (weatherId == 800) {
      switch (weatherIcon) {
        case '01d':
          imagePath = ConstantsService.sunny;
          break;
        case '01n':
          imagePath = ConstantsService.clearnightsky;
          break;
      }
    } else if (weatherId > 800) {
      imagePath = ConstantsService.cloudy;
    } else if (weatherId >= 500) {
      String indicator =
          weatherIcon.toString().substring(weatherIcon.length - 1);
      switch (indicator) {
        case 'd':
          imagePath = ConstantsService.rain;
          break;
        case 'n':
          imagePath = ConstantsService.eveningrain;
          break;
      }
    } else if (weatherId >= 300) {
      imagePath = ConstantsService.rain;
    } else if (weatherId >= 200) {
      imagePath = ConstantsService.thunderstorm;
    }

    emit(SetWeatherBG(weatherPath: imagePath));
  }
}
