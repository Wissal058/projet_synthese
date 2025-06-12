import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Pages/VerseListScreen.dart';
import 'SurahViewModel.dart';


class SurahListScreen extends StatefulWidget {
  const SurahListScreen({super.key});

  @override
  State<SurahListScreen> createState() => _SurahListScreenState();
}

class _SurahListScreenState extends State<SurahListScreen> {
  List<dynamic> surahs = [];
  bool isLoading = true;
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    fetchSurahs();
  }

  Future<void> fetchSurahs() async {
    final response = await http.get(Uri.parse('https://api.alquran.cloud/v1/surah'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        surahs = data['data'];
        isLoading = false;
      });
    } else {
      // gérer erreur
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erreur lors du chargement')));
    }
  }

  String getAudioUrl(int surahNumber) {
    return 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/$surahNumber.mp3';
  }

  void playAudio(String url) async {
    await audioPlayer.stop(); // stop audio en cours
    await audioPlayer.play(UrlSource(url));
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Sourates Audio du Coran')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
        itemCount: surahs.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final surah = surahs[index];
          return ListTile(
            title: Text('${surah['number']}. ${surah['englishName']}'),
            subtitle: Text(surah['name']),
            trailing: IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: () {
                final audioUrl = getAudioUrl(surah['number']);
                playAudio(audioUrl);
              },
            ),
          );
        },
      ),
    );
  }
}