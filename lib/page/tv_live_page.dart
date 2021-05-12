import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

/// @author zdl
/// date 2021/5/8 16:30
/// email zdl328465042@163.com
/// description tv播放页
class TvLivePage extends StatefulWidget {
  final String rtmp;

  const TvLivePage({Key key, @required this.rtmp}) : super(key: key);

  @override
  _TvLivePageState createState() => _TvLivePageState();
}

class _TvLivePageState extends State<TvLivePage> with WidgetsBindingObserver {

  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();
    player.setDataSource(widget.rtmp, autoPlay: true);
    // player.enterFullScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FijkView(
        player: player,
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused){
      player.pause();
    }else if(state == AppLifecycleState.resumed){
      player.start();
    }
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }
}
