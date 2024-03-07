// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, unused_element, prefer_const_constructors, unused_field, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PredecirGenero extends StatefulWidget {
  @override
  _PredecirGeneroState createState() => _PredecirGeneroState();
}

class _PredecirGeneroState extends State<PredecirGenero> {
  String _nombre = '';
  String _genero = '';
  double _probabilidad = 0.0;
  Color _cuadroColor = Color.fromARGB(255, 255, 255, 255);
  TextEditingController _controller = TextEditingController();

  void _cambiarColor(_genero) {
    setState(() {
      _cuadroColor = _genero.toLowerCase() == 'male'
          ? Colors.blue
          : _nombre.toLowerCase() == 'female'
              ? Colors.white
              : Colors.pink;
    });
  }

  Future<void> _consultarGenero(String nombre) async {
    final response =
        await http.get(Uri.parse('https://api.genderize.io?name=$nombre'));
    if (response.statusCode == 200) {
      setState(() {
        final jsonData = json.decode(response.body);
        _genero = jsonData['gender'];
        _probabilidad = jsonData['probability'];
        _cambiarColor(_genero);
      });
    } else {
      throw Exception('Error al consultar el genero');
    }
  }

  void _limpiar() {
    setState(() {
      _nombre = '';
      _genero = '';
      _probabilidad = 0.0;
      _cuadroColor = Colors.white;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          'Predecir Género',
          style: TextStyle(color: Colors.white),
        ),
      ),

      //body

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 80.0),
                //input
                TextField(
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {
                      _nombre = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText:
                        'Predecir género del nombre', // Etiqueta sobre el campo

                    prefixIcon:
                        Icon(Icons.grid_view_rounded), // Ícono descriptivo
                    hintText: 'Ingrese un nombre',
                    focusedBorder: OutlineInputBorder(
                      // Cambiar el color del borde cuando está enfocado
                      borderSide: BorderSide(
                        color: const Color.fromARGB(
                            255, 0, 0, 0), // Color personalizable
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      // Estilo de borde por defecto
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 140, 140, 140)),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20), // Ajuste de ancho
                  ),
                ),

                SizedBox(height: 20.0),

                //botones de color y generar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _consultarGenero(_nombre);
                      },
                      child: Text('Predecir',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _limpiar,
                      child: Text(
                        'Limpiar',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.0),

                //cuadro del color
                Container(
                  width: 350,
                  height: 350,
                  color: _cuadroColor,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _nombre.isNotEmpty
                            ? 'Género es: $_genero'
                            : 'Genero del nombre',
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Color.fromARGB(255, 82, 82, 82),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _nombre.isNotEmpty
                            ? 'Probabilidad es: $_probabilidad'
                            : '',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Color.fromARGB(255, 77, 76, 76),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _nombre.isNotEmpty ? 'Nombre: $_nombre' : '',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 99, 98, 98),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ),

                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}








/////////////////
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class PredecirGenero extends StatefulWidget {
//   @override
//   _PredecirGeneroState createState() => _PredecirGeneroState();
// }

// class _PredecirGeneroState extends State<PredecirGenero> {
//   TextEditingController _controller = TextEditingController();
//   String _nombre = '';
//   String _genero = '';

//   Future<void> _consultarGenero(String nombre) async {
//     final response =
//         await http.get(Uri.parse('https://api.genderize.io?name=$nombre'));
//     if (response.statusCode == 200) {
//       setState(() {
//         final jsonData = json.decode(response.body);
//         _genero = jsonData['gender'];
//       });
//     } else {
//       throw Exception('Error al consultar el genero');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Genderize API'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             TextField(
//               controller: _controller,
//               onChanged: (value) {
//                 setState(() {
//                   _nombre = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: 'Ingrese un nombre',
//                 hintText: 'Ej. Juan',
//               ),
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 _consultarGenero(_nombre);
//               },
//               child: Text('Consultar Género'),
//             ),
//             SizedBox(height: 20.0),
//             Text(
//               _genero.isNotEmpty ? 'Género: $_genero' : '',
//               style: TextStyle(fontSize: 20.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
