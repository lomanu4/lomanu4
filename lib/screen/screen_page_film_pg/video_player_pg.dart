import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialfilmfestival/widgets/votePage/votepage.dart';

class VideoPlayerScreen extends StatefulWidget {
  final Map videos;

  const VideoPlayerScreen({
    Key? key,
    required this.videos,
  }) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, widget.videos['urlvideo']);
    _betterPlayerController = BetterPlayerController(
        const BetterPlayerConfiguration(
          //Указываем настройки
          autoPlay: false,
        ),
        betterPlayerDataSource: betterPlayerDataSource);
  }
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videos['namefilm'].toString()),
        backgroundColor: Colors.blueGrey.withOpacity(0.8),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(
              controller: _betterPlayerController,
            ),
          ),
          DataproviderInherite(
            videoid: widget.videos['id'].toString(),
            value: widget.videos['urlvideo'].toString(),
            videoname: widget.videos['namefilm'].toString(),
            child: const Expanded(
              child: PageVote(),
            ),
          )
        ],
      ),
    );
  }
}

class DataproviderInherite extends InheritedWidget {
  final String value;
  final String videoid;
  final String videoname;
  const DataproviderInherite(
      {Key? key,
      required this.value,
      required this.videoname,
      required Widget child,
      required this.videoid})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(DataproviderInherite oldWidget) {
    return value !=
        oldWidget
            .value; //Сравниваем с тем что было в предыдущем виджете и если они не равны возращает true
    //а если они false то тогда не чего не поменялось
  }
}
