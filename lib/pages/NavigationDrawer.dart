// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:
          Color.fromARGB(255, 60, 60, 60), // Para que el color sea mas opaco
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        Container(),
        SizedBox(height: 30),
        Center(
          child: ListTile(
            title: Text("Vistas Solicitadas",
                textAlign: TextAlign.center, // Alinea el texto al centro
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                )),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.white,
          ),
          title: Text("Inicio",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              )),
          onTap: () {
            Navigator.pushNamed(context, '/inicio');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.male,
            color: Colors.white,
          ),
          title: Text("Predecir Genero",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              )),
          onTap: () {
            Navigator.pushNamed(context, '/PredecirGenero');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.people,
            color: Colors.white,
          ),
          title: Text("Determinar edad",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              )),
          onTap: () {
            Navigator.pushNamed(context, '/VistaImagenNombre');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.school,
            color: Colors.white,
          ),
          title: Text("Universidades",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              )),
          onTap: () {
            Navigator.pushNamed(context, '/UniversidadesView');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.cloud,
            color: Colors.white,
          ),
          title: Text("Clima en RD",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              )),
          onTap: () {
            Navigator.pushNamed(context, '/MostrarClima');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.newspaper,
            color: Colors.white,
          ),
          title: Text("Noticias WordPress",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              )),
          onTap: () {
            Navigator.pushNamed(context, '/NewsPage');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.work_outlined,
            color: Colors.white,
          ),
          title: Text("Acerca de",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              )),
          onTap: () {
            Navigator.pushNamed(context, '/Contratame');
          },
        ),
      ]),
    );
  }
}
