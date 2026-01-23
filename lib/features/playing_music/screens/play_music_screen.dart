import 'package:flutter/material.dart';
import 'package:music_app/controller/play_music_controller.dart';
import 'package:music_app/core/resources/constant_values.dart';
import 'package:music_app/core/resources/gradient_manager.dart';
import 'package:music_app/core/resources/size_manager.dart';
import 'package:music_app/models/player_ui_state.dart';

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
  bool _inited = false;
  late final PlayMusicController _playMusicController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_inited) return;
    _inited = true;

    final passedSong = ModalRoute.of(context)!.settings.arguments as SongModel;

    _playMusicController = PlayMusicController();
    _playMusicController.init(
      playlist: ConstantValues.quranList,
      passedSong: passedSong,
    );
    _playMusicController.play();
  }

  @override
  Widget build(BuildContext context) {
    if (!_inited) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomPlayMusicAppBar(
          onPressed: () => PlayMusicController.popNavigate(context),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: GradientManager.mainBackground,
          ),
          child: const Center(child: CircularProgressIndicator()),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomPlayMusicAppBar(
        onPressed: () => PlayMusicController.popNavigate(context),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: GradientManager.mainBackground,
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: SizeManager.s100),
                  ValueListenableBuilder<SongModel?>(
                    valueListenable: _playMusicController.currentSong,
                    builder: (_, s, _) {
                      if (s == null) return const SizedBox.shrink();
                      return PlayMusicInfo(song: s);
                    },
                  ),
                  ValueListenableBuilder<PlayerUiState>(
                    valueListenable: _playMusicController.uiState,
                    builder: (_, uiState, _) {
                      return CustomPlayingControllerRow(
                        value: 0.5,
                        onChangeEnd: (double v) =>
                            _playMusicController.seekByRatio(v),
                        onTapRandomMusic: () =>
                            _playMusicController.toggleShuffleMode(),
                        isRandomEnabled: uiState.isRandomEnabled,
                        onTapPrevNext: _playMusicController.skipPrev,
                        onTapPauseButton: _playMusicController.togglePlayPause,
                        isPlaying: uiState.isPlaying,
                        onTapLoop: () => _playMusicController.loopMusic(),
                        isRepeatEnabled: uiState.isRepeatEnabled,
                        onTapSkipNext: _playMusicController.skipNext,
                        sliderPosition: _playMusicController.sliderRatio$,
                        musicPosition: _playMusicController.musicPositionText$,
                        musicDuration: _playMusicController.musicDurationText$,
                      );
                    },
                  ),
                  const SizedBox(height: SizeManager.s14),
                  const TrackActionsBar(),
                  const UpNextQueueItem(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
