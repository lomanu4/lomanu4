// ignore_for_file: library_prefixes

import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart' as rootBundle;
import 'package:socialfilmfestival/UI/modul/modul_film_primo_grado.dart';
import 'package:socialfilmfestival/screen/screen_page_film_pg/page_filmpg.dart';

class FilmPrimoGrado extends StatefulWidget {
  const FilmPrimoGrado({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Future<List<Modulprimogrado>> readJsonData() async {
  final jsondata =
      await rootBundle.rootBundle.loadString('asset/jsonfmpg.json');
  final list = json.decode(jsondata) as List<dynamic>;

  //map json and initialize using DataModel
  return list.map((e) => Modulprimogrado.fromJson(e)).toList();
}

class _HomeScreenState extends State<FilmPrimoGrado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.withOpacity(0.8),
        title: const Text('Scuola secondo grado'),
      ),
      body: const PageFilmpgWidget(),
    ));
  }
}
