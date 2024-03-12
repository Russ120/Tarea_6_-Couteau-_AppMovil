// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:tarea_6_couteau/service/Clima_service.dart';

// import '../models/climaModel.dart';

// class ClimaPage extends StatefulWidget {
//   const ClimaPage({super.key});

//   @override
//   State<ClimaPage> createState() => _ClimaPageState();
// }

// class _ClimaPageState extends State<ClimaPage> {
//   // api key
//   final _climaService = ClimaService("d7427217d21f7eec06ae169706c99474");
//   Clima? _clima;

//   // fetch
//   _fetchClima() async {
//     //get the current city
//     String cityName = await _climaService.getCurrentCity();

//     //get weather for city
//     try {
//       final clima = await _climaService.getClima(cityName);
//       setState(() {
//         _clima = clima;
//       });
//     }

//     // any errors
//     catch (e) {
//       print(e);
//     }
//   }

//   // weather animations

//   // init state
//   @override
//   void initState() {
//     super.initState();
//     _fetchClima();

//     // fetch weather on startup
//     _fetchClima();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             //city name
//             Text(_clima?.cityName ?? "Loading city..."),

//             // temp
//             Text('${_clima?.temperature.round().toString()}°C')
//           ],
//         ),
//       ),
//     );
//   }
// }
