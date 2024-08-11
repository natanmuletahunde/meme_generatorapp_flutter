import 'dart:convert';
import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/nav_drawer.dart';

class TrendingMeme {
  final String title;
  final String Url;

  const TrendingMeme({required this.title, required this.Url});
  factory TrendingMeme.fromJson(Map<String, dynamic> json) {
    return TrendingMeme(title: json['title'], Url: json['url']);
  }
}

Future<List<TrendingMeme>> getTrending() async {
  final String response = await rootBundle.loadString('assets/trending.json');
  List<dynamic> data = jsonDecode(response);
  List<TrendingMeme> result = [];
  for (var i = 0; i < data.length; i++) {
    final entry = data[i];
    result.add(TrendingMeme.fromJson(entry));
  }
  return result;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<TrendingMeme>> memes;

  @override
  void initState() {
    super.initState();
    memes = getTrending();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meme of the Day',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      drawer: const NavDrawer(selected: DrawerSelection.home),
      body: SingleChildScrollView(
        child: FutureBuilder<List<TrendingMeme>>(
          future: memes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  SizedBox(
                    height: 450,
                    child: Swiper(
                      itemCount: snapshot.data!.length,
                      scale: 0.8,
                      duration: 8,
                      pagination: const SwiperPagination(),
                      itemBuilder: (context, index) {
                        final meme = snapshot.data![index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          elevation: 8.0,
                          margin: const EdgeInsets.all(16.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  meme.title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Image.network(
                                  meme.Url,
                                  width: 300,
                                  height: 300,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    '"Laughter is the best medicine, except for antibiotics. Then laughter is the second-best medicine."',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}