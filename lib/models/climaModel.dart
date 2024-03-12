// ignore_for_file: file_names

// class Clima {
//   final String cityName;
//   final double temperature;
//   final String rainCondition;

//   Clima(
//       {required this.cityName,
//       required this.temperature,
//       required this.rainCondition});

//   factory Clima.fromJson(Map<String, dynamic> json) {
//     return Clima(
//         cityName: json['name'],
//         temperature: json['main']['temp'].toDouble(),
//         rainCondition: json['weather'][0]['main']);
//   }
// }

class Weather {
  final String cityName;
  final double temperature;

  Weather({
    required this.cityName,
    required this.temperature,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['location']['name'] ?? '',
      temperature: double.parse(json['current']['temp_c'].toString()),
    );
  }
}
