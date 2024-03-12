// // ignore_for_file: constant_identifier_names

// import 'dart:convert';

// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;

// import '../models/climaModel.dart';

// class ClimaService {
//   static const BASE_URL = 'http://api.openweather.org/data/2.5/weather';
//   final String apiKey;

//   ClimaService(this.apiKey);

//   Future<Clima> getClima(String cityName) async {
//     final response = await http
//         .get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));

//     if (response.statusCode == 200) {
//       return Clima.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception("Failed  to load weather data");
//     }
//   }

//   Future<String> getCurrentCity() async {
//     // get permission from user
//     LocationPermission permission = await Geolocator.checkPermission();

//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//     }

//     // Fetch the current location
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);

//     // convert the location into a list of placemark objects
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(position.latitude, position.longitude);

//     // extract the city name from the first placemark
//     String? city = placemarks[0].locality;

//     return city ?? "";
//   }
// }
