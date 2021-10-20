import 'package:flutter/material.dart';

import '../UI/navigation_main.dart';
import '../widgets/imagetext_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: false,
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListView(children: [
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              'asset/1024x1024.png',
              width: 600,
              height: 240,
              fit: BoxFit.fitWidth,
              excludeFromSemantics: true,
            ),
            //imageLogo,
            const SizedBox(
              height: 5,
            ),
            textlogoMain,
            const SizedBox(
              height: 10.0,
            ),
            textlogoMain1,
            textlogoMain2,
            textlogoMain3,
            const SizedBox(
              height: 10.0,
            ),
            Center(
              child: ElevatedButton(
                child: const Text('Clicca qui'),
                onPressed: () {
                  Navigator.of(context).pushNamed(MainNavigationNames.mainList);
                },
              ),
            )
          ]),
        ));
  }
}
//   //Flexible(fit: FlexFit.loose, flex: 1, child: Text('$textLogo')),                    