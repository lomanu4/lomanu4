import 'package:flutter/material.dart';
import 'package:socialfilmfestival/UI/navigation_main.dart';
import 'package:socialfilmfestival/widgets/widgetmainlist.dart';

class MainList extends StatefulWidget {
  const MainList({Key? key}) : super(key: key);

  @override
  _MainList createState() => _MainList();
}

class _MainList extends State<MainList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.blueGrey.withOpacity(0.8),
        // home: Scaffold(
        //     appBar: AppBar(
        //       title: const Text('SSF'),
      ),
      body: ListView(children: [
        Image.asset(
          'asset/1024x1024.png',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(MainNavigationNames.filmPrimoGrado);
          },
          child: mainlist_1,
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(MainNavigationNames.home);
          },
          child: mainlist_2,
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(MainNavigationNames.home);
          },
          child: mainlist_3,
        ),
      ]),
    );
  }
}
