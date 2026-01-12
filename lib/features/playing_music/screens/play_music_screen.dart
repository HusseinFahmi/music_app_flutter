import 'package:flutter/material.dart';
import 'package:music_app/controller/play_music_controller.dart';
import 'package:music_app/core/resources/constant_values.dart';

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
  bool isPlaying = true;

  late SongModel song;
  late PlayMusicController _playMusicController;

  bool _inited = false;
  int currentIndex = 0;

  late Future<Duration?> _initFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_inited) return;
    _inited = true;

    final passedSong = ModalRoute
        .of(context)!
        .settings
        .arguments as SongModel;

    currentIndex =
        ConstantValues.quranList.indexWhere((s) => s.id == passedSong.id);
    if (currentIndex == -1) currentIndex = 0;

    song = ConstantValues.quranList[currentIndex];

    _playMusicController = PlayMusicController(song);

    _initFuture = _playMusicController.play();

    isPlaying = true;
  }

  Future<void> togglePlayPause() async {
    final newIsPlaying = await _playMusicController.toggleMusicState();
    if (!mounted) return;
    setState(() => isPlaying = newIsPlaying);
  }

  Future<void> onTapSkipNext() async {
    final length = ConstantValues.quranList.length;
    if (length == 0) return;

    int nextIndex = currentIndex + 1;
    if (nextIndex >= length) nextIndex = 0;

    final nextSong = ConstantValues.quranList[nextIndex];

    setState(() {
      currentIndex = nextIndex;
      song = nextSong;
      isPlaying = true;
    });

    _playMusicController = PlayMusicController(song);

    _initFuture = _playMusicController.play();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomPlayMusicAppBar(
        onPressed: () => PlayMusicController.popNavigate(context),
      ),
      body: FutureBuilder<Duration?>(
        future: _initFuture,
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff411F5C), Color(0xff261F5C)],
                ),
              ),
              child: const Center(child: CircularProgressIndicator()),
            );
          }

          final d = snap.data;
          final durationText = d == null ? "00:00" : _playMusicController
              .formatDuration(d);

          return Container(
            decoration: const BoxDecoration(
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
                      const SizedBox(height: 100),
                      PlayMusicInfo(song: song),
                      CustomPlayingControllerRow(
                        value: 0.5,
                        onChanged: (double v) {},
                        isPlaying: isPlaying,
                        onTapPauseButton: togglePlayPause,
                        onTapSkipNext: onTapSkipNext,
                        songDuration: durationText,
                        musicPosition: _playMusicController.musicPosition$,
                      ),
                      const SizedBox(height: 14),
                      const TrackActionsBar(),
                      const UpNextQueueItem(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

