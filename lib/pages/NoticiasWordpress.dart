// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'Post.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Post> posts = [];
  int contador = 0;

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    final response = await http
        .get(Uri.parse('https://sylvesterstallone.com/wp-json/wp/v2/posts'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List<dynamic>;
      setState(() {
        posts = jsonData.take(3).map((data) => Post.fromJson(data)).toList();
      });
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Noticias',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: posts.isEmpty
          ? Center(
              child: posts.isNotEmpty
                  ? Text('No hay noticias')
                  : CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      final url = Uri.parse(posts[index].url);

                      launchUrl(url);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Noticias",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Image.asset('assets/logo_sylvesterstallone.png',
                            height: 150),
                        SizedBox(height: 8),
                        Text(
                          posts[index].title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 4),
                        Text(
                          posts[index].summary,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 16), // Espacio entre las noticias
                        Divider(
                            height: 1, color: Colors.grey), // Línea divisoria
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
