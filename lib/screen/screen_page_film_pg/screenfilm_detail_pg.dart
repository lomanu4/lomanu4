import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialfilmfestival/UI/navigation_main.dart';
import 'package:socialfilmfestival/screen/screen_page_film_pg/video_player_pg.dart';
import 'package:socialfilmfestival/widgets/votePage/vote_page_widgets.dart';

class Detailspg extends StatefulWidget {
  const Detailspg({Key? key}) : super(key: key);

  @override
  State<Detailspg> createState() => _DetailspgState();
}

class _DetailspgState extends State<Detailspg> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    return (Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          //2
          SliverAppBar(
              backgroundColor: Colors.black.withOpacity(0.6),
              automaticallyImplyLeading: false,
              expandedHeight: 400.0,
              flexibleSpace: FlexibleSpaceBar(
                  title: SizedBox(
                    height: 150,
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 75,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Переходим на новую страницу
                            Navigator.of(context).pushNamed(
                                MainNavigationNames.videoPlay,
                                arguments: arg);
                         
                          },
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.blue,
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey.withOpacity(0.6),
                              shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              )),
                          //elevation: 2),
                          //textStyle: TextStyle(fontSize: 20)),
                          label: const Text(''),
                        ),
                      ),
                    ),
                  ),
                  background: Image.network(
                    arg['urlimage'],
                    height: 370,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )),
              leading: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              )),

          const SliverAppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              expandedHeight: 1000,
              flexibleSpace: FlexibleSpaceBar(background: TitlePGWidget())),
        ],
      ),
    ));
  }
}

class TitlePGWidget extends StatelessWidget {
  const TitlePGWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    return Container(
      // height: MediaQuery.of(context).size.height / ,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(15, 18, 18, 0.7),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0, 0),
            child: Text(
              arg['namefilm'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const DetalVotePGWidget(),
          const DescriptionsTitelPGWidget(),
          const DescriptinPGWidget(),
        ],
      ),
    );
  }
}

class DetalVotePGWidget extends StatelessWidget {
  const DetalVotePGWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.star_border,
          color: Colors.blue,
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            '8.1',
            style: TextStyle(color: Colors.white),
          ),
        ),
        TitleTimePGWidget(),
        SizedBox(
          width: 5,
        ),
        Text(
          '1h 51min',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: 15,
        ),
        CalendarPGWidget(),
        SizedBox(width: 5),
        Text(
          '10 October 2020',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

class TitleTimePGWidget extends StatelessWidget {
  const TitleTimePGWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.more_time_rounded,
      color: Colors.white,
    );
  }
}

class CalendarPGWidget extends StatelessWidget {
  const CalendarPGWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.calendar_today_rounded,
      color: Colors.white,
    );
  }
}

class DescriptionsTitelPGWidget extends StatelessWidget {
  const DescriptionsTitelPGWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.description_rounded,
          color: Colors.blue,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          'What`s the movie about?',
          style: TextStyle(color: Colors.white, fontSize: 18),
        )
      ],
    );
  }
}

class DescriptinPGWidget extends StatelessWidget {
  const DescriptinPGWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Text(
              arg['descriptionfilm'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
