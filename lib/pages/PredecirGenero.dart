// ignore_for_file: prefer_const_constructors, prefer_final_fields, library_private_types_in_public_api, avoid_print, use_key_in_widget_constructors, file_names

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

  Future<void> _consultarGenero(String nombre) async {
    try {
      final response =
          await http.get(Uri.parse('https://api.genderize.io?name=$nombre'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          _genero = jsonData['gender'];
          _probabilidad = jsonData['probability'];
          _cambiarColor(_genero);
        });
      } else {
        throw Exception('Error al consultar el género');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _cambiarColor(String genero) {
    setState(() {
      _cuadroColor = genero.toLowerCase() == 'male'
          ? Colors.blue
          : genero.toLowerCase() == 'female'
              ? Colors.pink
              : Colors.white;
    });
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 80.0),
                TextField(
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {
                      _nombre = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Predecir género del nombre',
                    prefixIcon: Icon(Icons.grid_view_rounded),
                    hintText: 'Ingrese un nombre',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 140, 140, 140)),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _consultarGenero(_nombre);
                      },
                      child: Text(
                        'Predecir',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
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
                if (_nombre.isNotEmpty)
                  Container(
                    width: 350,
                    height: 350,
                    color: _cuadroColor,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Género es: $_genero',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Probabilidad es: $_probabilidad',
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Nombre: $_nombre',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
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
