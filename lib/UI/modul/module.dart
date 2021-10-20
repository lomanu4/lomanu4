import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialfilmfestival/screen/screen_page_film_pg/video_player_pg.dart';

String? k;
// ignore: prefer_typing_uninitialized_variables
var m;
int resulindex = 0;

class SimpleCalcWidgetModel extends ChangeNotifier {
  //наследуемся от ChangeNotifier
  String? k;
  // ignore: prefer_typing_uninitialized_variables
  var m;
  bool checkin = true;
  List<bool> isSelected = List.generate(10, (_) => false);

  bool checkinR = true;

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

  void postData(String pollid) async {
    final response = await http.Client()
        .get(Uri.parse(pollid)); // страница берется по идексу списка,

    if (response.statusCode == 200) {
      var document = parse(response.body);
      final anchors = document.querySelectorAll('label');
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
        print(pollid);
        postDatatovote(pollid);
      } else {
        return print('errore');
      }
    } else {
      throw Exception();
    }
    // notifyListeners();
  }

  postDatatovote(String idvotefilm) async {
    // передаем ссылку на голосования
    // 200,400,404,500
    try {
      var response = await http.post(Uri.parse(idvotefilm), body: {
        "poll_answer": k.toString(),
        // "name": "Nico",
        // "email": "soma@email.com"
      });
      print(k); // параметр голоса который парсится со страници
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }


  
}
