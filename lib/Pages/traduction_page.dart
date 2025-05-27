import 'package:flutter/material.dart';

class AyahTranslationPage extends StatelessWidget {
  final List<Map<String, String>> ayatList = [
    {
      "surah": "Al-Fatiha",
      "ayah": "1",
      "arabic": "بِسْمِ اللَّهِ الرَّحْمَـٰنِ الرَّحِيمِ",
      "translation": "Au nom d'Allah, le Tout Miséricordieux, le Très Miséricordieux."
    },
    {
      "surah": "Al-Baqarah",
      "ayah": "2",
      "arabic": "ذَٰلِكَ الْكِتَابُ لَا رَيْبَ ۛ فِيهِ",
      "translation": "Ceci est le Livre au sujet duquel il n'y a aucun doute."
    },
    {
      "surah": "An-Nas",
      "ayah": "1",
      "arabic": "قُلْ أَعُوذُ بِرَبِّ النَّاسِ",
      "translation": "Dis : « Je cherche protection auprès du Seigneur des gens »"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color primaryColor = Color(0xFF6A1B9A); // Violet profond
    final Color accentColor = Color(0xFFE1BEE7);  // Violet clair

    return Scaffold(
      appBar: AppBar(
        title: Text('Traduction du Coran',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Lateef',
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0.9),
               centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF9F5FF), // Blanc violeté très clair
              Color(0xFFF0EBFA), // Blanc violeté clair
            ],
          ),
        ),
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          itemCount: ayatList.length,
          separatorBuilder: (context, index) => SizedBox(height: 12),
          itemBuilder: (context, index) {
            final ayah = ayatList[index];

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
                color: Colors.white,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // En-tête du verset
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Sourate ${ayah['surah']} - Verset ${ayah['ayah']}",
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),

                        // Texte arabe
                        Text(
                          ayah['arabic']!,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Scheherazade',
                            fontWeight: FontWeight.w600,
                            height: 1.8,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 20),

                        // Traduction
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: accentColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            ayah['translation']!,
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.6,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        SizedBox(height: 8),

                        // Actions
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.volume_up, size: 22),
                              color: primaryColor,
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.share, size: 22),
                              color: primaryColor,
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.bookmark_border, size: 22),
                              color: primaryColor,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}