// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_const

import 'package:flutter/material.dart';

import 'NavigationDrawer.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerContent(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: const Text(
          'Tarea 6 (Couteau)',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // esto es para posicionar si arriba en el centro o abajo
          crossAxisAlignment: CrossAxisAlignment
              .center, // esto es justificar en el centro los otros son start y end
          children: <Widget>[
            CircleAvatar(
              radius: 100, // Tamaño del círculo
              backgroundImage: AssetImage(
                  'assets/cajadeherramientas.png'), // Ruta de la imagen
            ),
            const SizedBox(height: 10),
            const Text(
              'Rusbel Rodriguez Paulino',
              style: TextStyle(
                fontSize: 26, // Tamaño de fuente
                fontWeight: FontWeight.bold, // Peso de fuente
                color: Color.fromARGB(255, 0, 0, 0), // Color del texto
                // Puedes agregar más propiedades según tus preferencias
              ),
            ),
            const Text(
              'Matricula: 2022-0129',
              style: TextStyle(
                fontSize: 20, // Tamaño de fuente
                color: Color.fromARGB(255, 0, 0, 0), // Color del texto
                // Puedes agregar más propiedades según tus preferencias
              ),
            ),
          ],
        ),
      ),
    );
  }
}
