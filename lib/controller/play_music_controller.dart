import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/models/song_model.dart';

class PlayMusicController {
  static void popNavigate(BuildContext context) {
    Navigator.pop(context);
  }

  // ---- singleton pattern ----
  // 1. private constructor
  // 2. instance
  // 3. factory constructor

  static PlayMusicController? _instance;

  factory PlayMusicController(SongModel song) {
    if (_instance == null) {
      _instance = PlayMusicController._internal(song);
    } else {
      _instance!.song = song;
    }
    return _instance!;
  }

  PlayMusicController._internal(this.song)
    : audioPlayer = AudioPlayer(),
      audioCache = AudioCache(prefix: "") {
    musicPosition$ = audioPlayer.onPositionChanged
        .map((d) => formatDuration(d))
        .asBroadcastStream();
  }

  SongModel song;
  final AudioPlayer audioPlayer;
  final AudioCache audioCache;

  Duration? audioTime;

  late final Stream<String> musicPosition$;

  Future<void> play() async {
    await audioPlayer.stop();
    final uri = await audioCache.load(song.songPath);
    await audioPlayer.play(UrlSource(uri.toString()));
  }

  Future<void> stop() async {
    await audioPlayer.stop();
  }

  Future<void> dispose() async {
    await audioPlayer.dispose();
    _instance = null;
  }

  Future<bool> toggleMusicState() async {
    if (audioPlayer.state == PlayerState.playing) {
      await audioPlayer.pause();
      return false;
    } else {
      await audioPlayer.resume();
      return true;
    }
  }

  Future<String> musicDuration() async {
    audioTime = await audioPlayer.getDuration();
    if (audioTime == null) return "00:00";
    return formatDuration(audioTime!);
  }

  String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    }
  }
}
