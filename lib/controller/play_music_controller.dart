import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/models/song_model.dart';

class PlayMusicController {
  static void popNavigate(BuildContext context) => Navigator.pop(context);

  static PlayMusicController? _instance;

  late final List<SongModel> _playlist;
  bool _playlistInited = false;
  int _currentIndex = 0;

  final AudioPlayer audioPlayer;
  final AudioCache audioCache;

  late final Stream<Duration> musicPosition$;
  late final Stream<Duration> musicDuration$;

  final ValueNotifier<bool> isPlaying = ValueNotifier<bool>(false);
  final ValueNotifier<SongModel?> currentSong = ValueNotifier<SongModel?>(null);

  StreamSubscription? _completeSub;

  factory PlayMusicController() {
    _instance ??= PlayMusicController._internal();
    return _instance!;
  }

  PlayMusicController._internal()
    : audioPlayer = AudioPlayer(),
      audioCache = AudioCache(prefix: "") {
    musicPosition$ = audioPlayer.onPositionChanged.asBroadcastStream();
    musicDuration$ = audioPlayer.onDurationChanged.asBroadcastStream();
    _completeSub = audioPlayer.onPlayerComplete.listen((_) {
      skipNext();
    });
  }

  int get currentIndex => _currentIndex;

  void init({
    required List<SongModel> playlist,
    required SongModel passedSong,
  }) {
    if (!_playlistInited) {
      _playlist = playlist;
      _playlistInited = true;
    }

    final idx = _playlist.indexWhere((s) => s.id == passedSong.id);
    _currentIndex = (idx == -1) ? 0 : idx;

    currentSong.value = _playlist[_currentIndex];
  }

  Future<void> play() async {
    final s = currentSong.value;
    if (s == null) return;

    await audioPlayer.stop();
    final uri = await audioCache.load(s.songPath);
    await audioPlayer.play(UrlSource(uri.toString()));
    isPlaying.value = true;
  }

  Future<void> stop() async {
    await audioPlayer.stop();
    isPlaying.value = false;
  }

  Future<void> togglePlayPause() async {
    if (audioPlayer.state == PlayerState.playing) {
      await audioPlayer.pause();
      isPlaying.value = false;
    } else {
      await audioPlayer.resume();
      isPlaying.value = true;
    }
  }

  Future<void> skipNext() async {
    if (!_playlistInited || _playlist.isEmpty) return;

    _currentIndex++;
    if (_currentIndex >= _playlist.length) _currentIndex = 0;

    currentSong.value = _playlist[_currentIndex];
    await play();
  }

  Future<void> skipPrev() async {
    if (!_playlistInited || _playlist.isEmpty) return;

    _currentIndex--;
    if (_currentIndex < 0) _currentIndex = _playlist.length - 1;

    currentSong.value = _playlist[_currentIndex];
    await play();
  }

  String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  Stream<String> get musicPositionText$ =>
      musicPosition$.map((d) => formatDuration(d));

  Stream<String> get musicDurationText$ =>
      musicDuration$.map((d) => formatDuration(d));

  Stream<double> get sliderRatio$ => musicPosition$.asyncMap((pos) async {
    final dur = await audioPlayer.getDuration();
    if (dur == null || dur.inMilliseconds == 0) return 0.0;

    final ratio = pos.inMilliseconds / dur.inMilliseconds;
    return ratio.clamp(0.0, 1.0);
  });

  Future<void> seekByRatio(double ratio) async {
    final r = ratio.clamp(0.0, 1.0);
    final dur = await audioPlayer.getDuration();
    if (dur == null || dur.inMilliseconds == 0) return;

    final targetMs = (dur.inMilliseconds * r).round();
    await audioPlayer.seek(Duration(milliseconds: targetMs));
  }

  Future<void> dispose() async {
    await _completeSub?.cancel();
    await audioPlayer.dispose();
    isPlaying.dispose();
    currentSong.dispose();
    _instance = null;
  }
}
