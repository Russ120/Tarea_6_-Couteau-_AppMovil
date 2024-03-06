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
            Navigator.pushNamed(context, '/inicio');
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
            Navigator.pushNamed(context, '/inicio');
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
            Navigator.pushNamed(context, '/inicio');
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
            Navigator.pushNamed(context, '/inicio');
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
            Navigator.pushNamed(context, '/inicio');
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

////////////////////////////////////
///
///
// ///
// class DrawerContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           Container(
//             height: 300,
//             color: Color.fromARGB(255, 237, 231, 231),
//             child: CircleAvatar(
//               radius: 200, // Tamaño del círculo
//               backgroundImage:
//                   AssetImage('assets/Foto.jpg'), // Ruta de la imagen
//             ),
//           ),
//           Center(
//             child: ListTile(
//               title: Text(
//                 "Rusbel Rodriguez Paulino",
//                 textAlign: TextAlign.center, // Alinea el texto al centro
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 68, 52, 18),
//                 ),
//               ),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text("Presentación"),
//             onTap: () {
//               Navigator.pushNamed(context, '/presentation');
//             },
//           ),
//           Divider(),
//           ListTile(
//               leading: Icon(Icons.calculate),
//               title: Text("Calcular Tabla"),
//               onTap: () {
//                 Navigator.pushNamed(context, '/TablaMultiplicar');
//               }),
//           Divider(),
//           ListTile(
//               leading: Icon(Icons.multiline_chart),
//               title: Text("Analisis de numeros"),
//               onTap: () {
//                 Navigator.pushNamed(context, '/analisisNumeros');
//               }),
//           Divider(),
//         ],
//       ),
//     );
//   }
// }
