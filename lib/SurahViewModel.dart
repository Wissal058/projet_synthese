import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'Pages/DatabaseHelper.dart';
import 'Surah.dart';
import 'Pages/Verse.dart';

class SurahViewModel extends ChangeNotifier {
  List<Surah> _surahs = [];
  bool _isLoading = true;
  final dbHelper = DatabaseHelper();

  List<Surah> get surahs => _surahs;
  bool get isLoading => _isLoading;

  Future<void> fetchSurahs() async {
    _isLoading = true;
    notifyListeners();

    bool isLocalEmpty = await dbHelper.isEmpty();

    if (isLocalEmpty) {
      debugPrint('📡 Téléchargement depuis l’API...');
      final response = await http.get(Uri.parse('https://api.alquran.cloud/v1/surah'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> list = data['data'];

        _surahs = list.map((e) => Surah.fromJson(e)).toList();
        await dbHelper.insertSurahs(_surahs);

        debugPrint('✅ Sourates insérées localement');
      } else {
        debugPrint('❌ Erreur HTTP');
        throw Exception('Erreur API');
      }
    } else {
      debugPrint('💾 Chargement local depuis SQLite...');
      _surahs = await dbHelper.getSurahs();
    }

    _isLoading = false;
    notifyListeners();
  }

  // Chargement des versets avec cache local SQLite
  Future<List<Verse>> fetchVerses(int surahNumber) async {
    // Vérifie si versets déjà en local
    bool hasLocal = await dbHelper.hasVersesForSurah(surahNumber);

    if (hasLocal) {
      // Chargement depuis SQLite
      return await dbHelper.getVersesBySurah(surahNumber);
    } else {
      // Récupération depuis API
      final url = Uri.parse('https://api.alquran.cloud/v1/surah/$surahNumber/ar.alafasy');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> ayahsJson = data['data']['ayahs'];
        List<Verse> verses = ayahsJson.map((json) => Verse.fromJson(json, surahNumber)).toList();

        // Stockage local
        await dbHelper.insertVerses(verses);

        return verses;
      } else {
        throw Exception('Erreur lors du chargement des versets');
      }
    }
  }

}
