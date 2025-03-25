import 'package:dartz/dartz.dart';
import 'package:openweatherapp/data/datasources/weather_remote_datasource.dart';
import 'package:openweatherapp/data/exceptions/exceptions.dart';
import 'package:openweatherapp/data/models/whole_weather_model.dart';
import 'package:openweatherapp/domain/failures/failures.dart';

abstract class WeatherRepo {
  Future<Either<Failure, WholeWeatherModel>> getWeatherPayLoad(
      double lat, double lon);
}

class WeatherRepoImpl implements WeatherRepo {
  final WeatherRemoteDatasource _datasource = WeatherRemoteDatasourceImpl();

  @override
  Future<Either<Failure, WholeWeatherModel>> getWeatherPayLoad(
      double lat, double lon) async {
    try {
      final result = await _datasource.getWeatherPayLoad(lat, lon);
      return right(result);
    } on ServerException401 catch (_) {
      return left(ServerFailure401());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
