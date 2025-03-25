import 'package:dartz/dartz.dart';
import 'package:openweatherapp/data/models/whole_weather_model.dart';
import 'package:openweatherapp/data/repository/weather_repo_impl.dart';
import 'package:openweatherapp/domain/failures/failures.dart';

class WeatherUsecases {
  final _repoImpl = WeatherRepoImpl();

  Future<Either<Failure, WholeWeatherModel>> getWeatherPayLoad(
      double lat, double lon) async {
    return _repoImpl.getWeatherPayLoad(lat, lon);
  }
}
