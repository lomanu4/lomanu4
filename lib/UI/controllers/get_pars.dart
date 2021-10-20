import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

String? k;
// ignore: prefer_typing_uninitialized_variables
var m;
int resulindex = 0;
List<bool> isSelected = List.generate(10, (_) => false);

class SimpleCalcWidgetModel extends ChangeNotifier {
  //наследуемся от ChangeNotifier
  void postData() async {
    final response = await http.Client()
        .get(Uri.parse('https://sff.softoolstore.de/vote.php?id=2'));

    if (response.statusCode == 200) {
      RegExp exp = RegExp(
          r"value=['"
          r'"'
          r"](\d+)",
          multiLine: false,
          caseSensitive: false,
          unicode: true);
      Iterable<RegExpMatch> matches = exp.allMatches(response.body);
      matches.toList();
      List<String> valuemap = [];

      for (m in matches) {
        valuemap.add(m.group(1).toString());
      }
      if (valuemap.isNotEmpty) {
        print(valuemap[resulindex]);
        m = valuemap[resulindex];
        k = m;
        print(k);
      } else {
        return print('errore');
      }
    } else {
      throw Exception();
    }
    notifyListeners();
  }

  void pressed(int index) {
    for (int buttonIndex = 0; buttonIndex < isSelected.length; ++buttonIndex) {
      if (buttonIndex == index) {
        isSelected[buttonIndex] = true;
        resulindex = buttonIndex;
      } else {
        isSelected[buttonIndex] = false;
      }
    }

    notifyListeners();
  }
}
