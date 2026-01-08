import 'package:music_app/core/resources/image_manager.dart';
import 'package:music_app/models/song_model.dart';

class ConstantValues {
  static List<SongModel> quranList = [
    SongModel(
      imagePath: ImageManager.surahAlImran,
      singerName: "Omar Dia",
      songName: 'Al Imran',
      songPath: 'assets/quran/Al_Emran.mp3',
    ),
    SongModel(
      imagePath: ImageManager.surahAnNur,
      singerName: "Yasser Al-Dawsri",
      songName: 'Al Nur',
      songPath: 'assets/quran/Al_Noor.m4a',
    ),
    SongModel(
      imagePath: ImageManager.surahFussilat,
      singerName: "Nasser Al-Qutami",
      songName: 'Fussilat',
      songPath: 'assets/quran/Fosilat.mp3',
    ),
  ];
}
