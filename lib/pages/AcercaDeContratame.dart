// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Contratame extends StatelessWidget {
  final String imagePath = "assets/Foto.jpg";
  final String name = "Rusbel Rodriguez Paulino";
  final String phoneNumber = "809-788-6768";
  final String cellphoneNumber = "829-641-6468";
  final String email = "rusbelrodriguez50@gmail.com";
  final String githubUsername = "Russ120";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Contrátame',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Imagen del perfil
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Nombre
            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            // Información de contacto
            ContactInfoItem(
              icon: Icons.phone,
              label: 'Teléfono',
              value: phoneNumber,
            ),
            ContactInfoItem(
              icon: Icons.phone_android,
              label: 'Celular',
              value: cellphoneNumber,
            ),
            ContactInfoItem(
              icon: Icons.email,
              label: 'Correo Electrónico',
              value: email,
            ),
            ContactInfoItem(
              icon: Icons.code,
              label: 'Github',
              value: githubUsername,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ContactInfoItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                value,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
