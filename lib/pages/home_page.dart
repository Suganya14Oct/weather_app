
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather_provider/pages/search_page.dart';
import 'package:open_weather_provider/provider/weather/weather_provider.dart';
import 'package:open_weather_provider/repositories/weather_repository.dart';
import 'package:open_weather_provider/services/weather_api_services.dart';
import 'package:open_weather_provider/widgets/error_dialog.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? _city;
  late final WeatherProvider _weatherProv;

  @override
  void initState() {
    super.initState();
    _weatherProv = context.read<WeatherProvider>();
    _weatherProv.addListener(_registerListener);
  }

  @override
  void dispose() {
    _weatherProv.removeListener(_registerListener);
    super.dispose();
  }

  void _registerListener (){
    final WeatherState ws = context.read<WeatherProvider>().state;

    if (ws.status == WeatherStatus.error) {

    }
  }

  Widget _showWeather() {

    final state = context.watch<WeatherProvider>().state;

    if (state.status == WeatherStatus.initial){
      return Center(
        child: Text('Select a city', style: const TextStyle(fontSize: 20.0)),
      );
    }

    if (state.status == WeatherStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state.status == WeatherStatus.error && state.weather.name == '') {
      return Center(
        child: const Text('Select a city', style: TextStyle(fontSize: 20.0)),
      );
    }

    return Center(
      child: Text(state.weather.name, style: TextStyle(fontSize: 18.0),
      ),
    );

  }


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
      body: _showWeather(),
    );
  }
}
