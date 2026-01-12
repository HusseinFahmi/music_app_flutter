import 'package:music_app/core/resources/image_manager.dart';
import 'package:music_app/models/song_model.dart';

class ConstantValues {
  static List<SongModel> quranList = [
    SongModel(
      id: 0,
      imagePath: ImageManager.surahAlImran,
      singerName: "Omar Dia",
      songName: 'Al Imran',
      songPath: 'assets/quran/Al_Emran.mp3',
    ),
    SongModel(
      id: 1,
      imagePath: ImageManager.surahAnNur,
      singerName: "Yasser Al-Dawsri",
      songName: 'Al Nur',
      songPath: 'assets/quran/Al_Noor.m4a',
    ),
    SongModel(
      id: 2,
      imagePath: ImageManager.surahFussilat,
      singerName: "Nasser Al-Qutami",
      songName: 'Fussilat',
      songPath: 'assets/quran/Fosilat.mp3',
    ),
  ];
}
