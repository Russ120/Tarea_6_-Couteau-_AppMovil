// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tarea_6_couteau/pages/PredecirGenero.dart';

import 'pages/AcercaDeContratame.dart';
import 'pages/Inicio.dart';
import 'pages/NavigationDrawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tarea 6 (Couteau)',
        home: const Inicio(),
        routes: {
          // '/presentation': (context) => Presentation(),
          '/inicio': (context) => Inicio(),
          '/NavigationDrawer': (context) => DrawerContent(),
          '/Contratame': (context) => Contratame(),
          '/PredecirGenero': (context) => PredecirGenero(),
        });
  }
}
