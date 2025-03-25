import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:openweatherapp/application/pages/weather/weather_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures binding is initialized
  await dotenv.load(); // Load environment variables
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Open Weather',
      home: WeatherPageWrapper(),
    );
  }
}
