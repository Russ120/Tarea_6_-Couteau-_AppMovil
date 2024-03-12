// ignore_for_file: prefer_const_constructors, avoid_print, library_private_types_in_public_api, use_key_in_widget_constructors, unused_element, prefer_final_fields, unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UniversityListScreen extends StatefulWidget {
  @override
  _UniversityListScreenState createState() => _UniversityListScreenState();
}

class _UniversityListScreenState extends State<UniversityListScreen> {
  List<Map<String, dynamic>> universities = [];
  TextEditingController _controller = TextEditingController();
  String _pais = '';

  Future<void> fetchUniversities(String pais) async {
    try {
      final url =
          Uri.parse('http://universities.hipolabs.com/search?country=$pais');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;
        setState(() {
          universities = data.cast<Map<String, dynamic>>();
          print("Estas son las universidades");
          print(universities[0]["name"]);
          print(universities);
        });
      } else {
        // Maneja el error (por ejemplo, muestra un mensaje de error)
        print('Error al obtener las universidades: ${response.statusCode}');
      }
    } catch (error) {
      // Maneja el error de red
      print('Error de red: $error');
    }
  }

  void _limpiar() {
    setState(() {
      _controller.clear();
      universities = [];
      _pais = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          'Universidades de países',
          style: TextStyle(color: Colors.white),
        ),
      ),

      // Cuerpo de la página
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Input de país
            TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  _pais = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Buscar universidades',
                labelStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: Icon(Icons.grid_view_rounded),
                hintText: 'Ingrese un país',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 140, 140, 140),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
              ),
            ),

            SizedBox(height: 20.0),

            // Botones limpiar y buscar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_pais.isNotEmpty) {
                      fetchUniversities(_pais);
                    } else {
                      print('Ingrese un país antes de buscar.');
                    }
                  },
                  child: Text(
                    'Buscar',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '$_pais',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.0),

            // Lista de universidades
            universities.isEmpty
                ? Center(
                    child: universities.isNotEmpty
                        ? CircularProgressIndicator()
                        : Text('No hay universidades'),
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: universities.length,
                      itemBuilder: (context, index) {
                        final university = universities[index];
                        final name =
                            university['name'] ?? 'Nombre no disponible';
                        final webPages =
                            university['web_pages'] as List<dynamic>;
                        final webPage = webPages.isNotEmpty
                            ? webPages[0]
                            : 'Página no disponible';

                        return ListTile(
                          title: Text(
                            name,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          subtitle: Text(
                            'Web: $webPage',
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                        );
                      },
                    ),
                  ),

            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
