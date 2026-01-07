import 'package:music_app/core/resources/image_manager.dart';
import 'package:music_app/models/song_model.dart';

class ConstantValues {
  static List<SongModel> quranList = [
    SongModel(
      imagePath: ImageManager.surahAlImran,
      singerName: "Omar Dia",
      songName: 'Al Imran',
      songPath: 'assets/images/quran/Surah_Al_Imran.png',
    ),
    SongModel(
      imagePath: ImageManager.surahAnNur,
      singerName: "Yasser Al-Dawsri",
      songName: 'Al Nur',
      songPath: 'assets/images/quran/Surah_An-Nur.png',
    ),
    SongModel(
      imagePath: ImageManager.surahFussilat,
      singerName: "Nasser Al-Qutami",
      songName: 'Fussilat',
      songPath: 'assets/images/quran/Surah_Fussilat.png',
    ),
  ];
}
