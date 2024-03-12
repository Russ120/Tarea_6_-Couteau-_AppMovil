// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, file_names, library_private_types_in_public_api
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/climaModel.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Weather weather = Weather(cityName: '', temperature: 0.0);

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final weatherResponse = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=91e2a4d48c9d498180645007241103&q=Santo%20Domingo'));

    setState(() {
      weather = Weather.fromJson(jsonDecode(weatherResponse.body));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          'Clima Santo Domingo',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud,
                size: 80,
                color: Colors.blue[900],
              ),
              const SizedBox(height: 20),
              Text(
                'Clima en ${weather.cityName}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${weather.temperature.toStringAsFixed(1)}°C',
                style: const TextStyle(
                  fontSize: 36,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
