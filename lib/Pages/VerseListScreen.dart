import 'package:flutter/material.dart';
import '../SurahViewModel.dart';
import 'Verse.dart';

class VerseListScreen extends StatefulWidget {
  final int surahNumber;
  final String surahName;

  VerseListScreen({required this.surahNumber, required this.surahName});

  @override
  _VerseListScreenState createState() => _VerseListScreenState();
}

class _VerseListScreenState extends State<VerseListScreen> {
  final SurahViewModel viewModel = SurahViewModel();
  late Future<List<Verse>> _versesFuture;

  @override
  void initState() {
    super.initState();
    _versesFuture = viewModel.fetchVerses(widget.surahNumber);
  }

  // 🔵 Fonction pour créer une icône en forme de cercle avec le numéro
  InlineSpan circleNumber(int number) {
    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.purpleAccent,
        ),
        child: Text(
          number.toString(),
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.surahName)),
      body: FutureBuilder<List<Verse>>(
        future: _versesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());

          if (snapshot.hasError)
            return Center(child: Text('Erreur : ${snapshot.error}'));

          final verses = snapshot.data ?? [];

          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: RichText(
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  height: 2,
                ),
                children: verses.expand((verse) => [
                  TextSpan(text: verse.text + ' '),
                  circleNumber(verse.ayahNumber),
                  TextSpan(text: ' '),
                ]).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}