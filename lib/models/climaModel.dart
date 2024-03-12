// ignore_for_file: file_names

class Clima {
  final String cityName;
  final double temperature;
  final String rainCondition;

  Clima(
      {required this.cityName,
      required this.temperature,
      required this.rainCondition});

  factory Clima.fromJson(Map<String, dynamic> json) {
    return Clima(
        cityName: json['name'],
        temperature: json['main']['temp'].toDouble(),
        rainCondition: json['weather'][0]['main']);
  }
}
