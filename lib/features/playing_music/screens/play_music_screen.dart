import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/controller/play_music_controller.dart';

import '../../../models/song_model.dart';
import '../widgets/custom_play_music_app_bar.dart';
import '../widgets/custom_playing_controller_row.dart';
import '../widgets/play_music_info.dart';
import '../widgets/track_actions_bar.dart';
import '../widgets/up_next_queue_item.dart';

class PlayMusicScreen extends StatefulWidget {
  const PlayMusicScreen({super.key});

  @override
  State<PlayMusicScreen> createState() => _PlayMusicScreenState();
}

class _PlayMusicScreenState extends State<PlayMusicScreen> {

  late final SongModel song;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    song = ModalRoute
        .of(context)!
        .settings
        .arguments as SongModel;

    play();
  }

  Future<void> play() async {
    AudioCache audioCache = AudioCache(prefix: "");
    Uri uri = await audioCache.load(song.songPath);
    AudioPlayer audioPlayer = AudioPlayer();
    audioPlayer.play(UrlSource(uri.toString()));
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: CustomPlayMusicAppBar(
        onPressed: () => PlayMusicController.popNavigate(context),
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff411F5C), Color(0xff261F5C)],
          ),
        ),

        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  PlayMusicInfo(song: song,),

                  CustomPlayingControllerRow(
                    value: 0.5,
                    onChanged: (double p1) {},
                  ),

                  SizedBox(height: 14),

                  TrackActionsBar(),

                  UpNextQueueItem(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
