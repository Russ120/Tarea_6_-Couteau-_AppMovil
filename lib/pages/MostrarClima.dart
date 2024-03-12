// // ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors
// // weather api
// // 91e2a4d48c9d498180645007241103

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class MostrarClima extends StatefulWidget {
//   @override
//   _MostrarClimaState createState() => _MostrarClimaState();
// }

// class _MostrarClimaState extends State<MostrarClima> {
//   String apiKey = 'd7427217d21f7eec06ae169706c99474';
//   String city = 'Santo domingo'; // Ciudad para la que deseas obtener el clima
//   late String apiUrl;

//   Map<String, dynamic> weatherData = {};

//   @override
//   void initState() {
//     super.initState();
//     apiUrl = 'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city';
//     fetchWeatherData();
//   }

//   Future<void> fetchWeatherData() async {
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       setState(() {
//         weatherData = json.decode(response.body);
//       });
//     } else {
//       throw Exception('Failed to load weather data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Weather View'),
//       ),
//       body: Center(
//         child: weatherData.isNotEmpty
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     'Temperature: ${weatherData['current']['temp_c']}°C',
//                     style: TextStyle(fontSize: 24),
//                   ),
//                   Text(
//                     'Condition: ${weatherData['current']['condition']['text']}',
//                     style: TextStyle(fontSize: 24),
//                   ),
//                 ],
//               )
//             : CircularProgressIndicator(),
//       ),
//     );
//   }
// }





