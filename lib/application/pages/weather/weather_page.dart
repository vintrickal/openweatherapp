// ignore_for_file: must_be_immutable, unused_element, deprecated_member_use

import 'package:openweatherapp/application/core/constants/constants.dart';
import 'package:openweatherapp/data/models/whole_weather_model.dart';
import 'package:openweatherapp/application/core/services/font_service.dart';
import 'package:openweatherapp/application/core/widgets/scaffold.dart';
import 'package:openweatherapp/application/pages/weather/cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherPageWrapper extends StatelessWidget {
  const WeatherPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..onInitial(),
      child: WeatherPage(),
    );
  }
}

class WeatherPage extends StatelessWidget {
  WeatherPage({super.key});

  String _locationName = '';
  String _currentTemp = '';
  String weatherBG = ConstantsService.sunny;
  bool _isLoading = false;
  WholeWeatherModel weatherModel = WholeWeatherModel();

  @override
  Widget build(BuildContext context) {
    var fontService = FontService();
    var color = Theme.of(context).colorScheme;

    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is SetWeatherBG) {
          weatherBG = state.weatherPath;
        }

        if (state is LoadingWeatherData) {
          _isLoading = true;
        }

        if (state is LoadedWeatherPayload) {
          weatherModel = state.model;
          _locationName = weatherModel.name!;
          _currentTemp = weatherModel.main!.temp!.toStringAsFixed(0);
          _isLoading = false;
        }
      },
      builder: (context, state) {
        return CustomScaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(weatherBG),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _sectionSummaryHeader(fontService, context, color),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _sectionSummaryHeader(
      FontService fontService, BuildContext context, ColorScheme color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 100),
        _isLoading
            ? const SizedBox()
            : Text(
                'My Location',
                style: fontService.s40w700White(context),
              ),
        _isLoading
            ? CircularProgressIndicator()
            : Text(
                _locationName,
                style: fontService.s16w700White(context),
              ),
        _isLoading
            ? const SizedBox()
            : RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: _currentTemp,
                      style: fontService.s80w700White(context),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(2, -50),
                        child: Text(
                          '°C',
                          style: fontService.s20w700White(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
