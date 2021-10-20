import 'package:flutter/material.dart';
import 'package:socialfilmfestival/mainlist.dart';
import 'package:socialfilmfestival/screen/screen_page_film_pg/film_primo_grado_widget.dart';

import 'package:socialfilmfestival/screen/screen_page_film_pg/screenfilm_detail_pg.dart';
import 'package:socialfilmfestival/screen/screen_page_film_pg/video_player_pg.dart';
import 'package:socialfilmfestival/widgets/votePage/votepage.dart';

import '../home.dart';
import '../splash_screen.dart';

abstract class MainNavigationNames {
  static const logo = '/';
  static const home = '/home';

  static const mainList = 'home/mainlist/';
  static const filmPrimoGrado = 'home/mainlist/filmpg';
  static const pageVote = '/home/mainlist/pagevote';
  static const detailPG = 'home/mainlist/filmpg/details';
  static const videoPlay = 'home/mainlist/filmpg/details/videoplayer';
}

class MainNaavigation {
  final initialRoute = MainNavigationNames.logo;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationNames.logo: (context) => const SplashScreen(),
    MainNavigationNames.home: (context) => const HomeScreen(),
    MainNavigationNames.mainList: (context) => const MainList(),
    MainNavigationNames.filmPrimoGrado: (context) => const FilmPrimoGrado(),
    MainNavigationNames.pageVote: (context) => const PageVote(),
    MainNavigationNames.detailPG: (context) => const Detailspg(),
    MainNavigationNames.videoPlay: (context) {
      /// Передаем аргумент с проверкой на нулл
      ///
      final arguments = ModalRoute.of(context)?.settings.arguments as Map;
      //final idmovie = ModalRoute.of(context)?.settings.arguments as int;
      return VideoPlayerScreen(
        videos: arguments,
      );
    }
  };
}
