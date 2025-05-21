
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather_provider/pages/search_page.dart';
import 'package:open_weather_provider/provider/weather/weather_provider.dart';
import 'package:open_weather_provider/repositories/weather_repository.dart';
import 'package:open_weather_provider/services/weather_api_services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? _city;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
            _city = await Navigator.push(context, MaterialPageRoute(builder: (context){
              return SearchPage();
            }));
            print("city: $_city");
            if (_city != null){
              context.read<WeatherProvider>().fetchWeather(_city!);
            }
          },
          )
        ],
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
