// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, unused_field, no_leading_underscores_for_local_identifiers, unused_element, avoid_print, prefer_final_fields, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeterminarEdad extends StatefulWidget {
  @override
  _DeterminarEdadState createState() => _DeterminarEdadState();
}

class _DeterminarEdadState extends State<DeterminarEdad> {
  String _nombre = '';
  int _edad = 0;
  String _imagenUrl = '';
  String _nombreMostrar = '';
  String _estadoMostrar = '';
  int _edadMostrar = 0;
  TextEditingController _controller = TextEditingController();

  void _actualizarVista(int edad, String nombre) {
    setState(() {
      // Lógica para determinar la imagen y el nombre según la entrada del usuario
      if (edad >= 60) {
        _imagenUrl = 'assets/segun_la_edad/vejez.png';
        _edadMostrar = edad;
        _nombreMostrar = nombre;
        _estadoMostrar = 'Estado de Vejez';
      } else if (edad >= 25 && edad < 60) {
        _imagenUrl = 'assets/segun_la_edad/adultez.png';
        _edadMostrar = edad;
        _nombreMostrar = nombre;
        _estadoMostrar = 'Estado de Adultez';
      } else if (edad >= 16 && edad < 25) {
        _imagenUrl = 'assets/segun_la_edad/juventud.png';
        _edadMostrar = edad;
        _nombreMostrar = nombre;
        _estadoMostrar = 'Estado de Juventud';
      } else if (edad >= 1 && edad < 16) {
        _imagenUrl = 'assets/segun_la_edad/Niñez.png';
        _nombreMostrar = nombre;
        _edadMostrar = edad;
        _estadoMostrar = 'Estado de Infancia';
      } else {
        // Restablecer si el nombre no coincide
        _imagenUrl = '';
        _edadMostrar = 0;
        _estadoMostrar = '';
        _nombreMostrar = '';
      }
    });
  }

  void _limpiar() {
    setState(() {
      _nombre = '';
      _imagenUrl = '';
      _edadMostrar = 0;
      _nombreMostrar = '';
      _controller.clear();
    });
  }

  Future<void> _determinarEdad(String nombre) async {
    try {
      final response =
          await http.get(Uri.parse('https://api.agify.io?name=$nombre'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          _edad = jsonData["age"];
          _actualizarVista(_edad, nombre);
        });
      } else {
        throw Exception('Error al consultar el género');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: Text(
            'Determinar edad',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                //ingresar nombre

                TextField(
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {
                      _nombre = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Determine la edad',
                    labelStyle:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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

                //separacion
                SizedBox(height: 20.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _determinarEdad(_nombre);
                      },
                      child: Text(
                        'Determinar edad',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        _limpiar();
                      },
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

                if (_imagenUrl.isNotEmpty)
                  Column(
                    children: [
                      Image.asset(
                        _imagenUrl,
                        width: 500.0, // Ajusta el ancho según tus necesidades
                        height: 200.0, // Ajusta la altura según tus necesidades
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        _nombreMostrar,
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 0.0),
                      Text(
                        'Edad: $_edadMostrar',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 0.0),
                      Text(
                        _estadoMostrar,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ));
  }
}
