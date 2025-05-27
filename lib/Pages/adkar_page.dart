import 'package:flutter/material.dart';

class AdkarPage extends StatelessWidget {
  final List<Map<String, String>> adkarList = [
    {
      "title": "Adhkar du matin",
      "content": "اللّهـمَّ أَنْتَ رَبِّـي لا إلهَ إلاّ أَنْتَ، خَلَقْتَني وَأَنا عَبْـدُك...",
      "count": "3 fois"
    },
    {
      "title": "Adhkar du soir",
      "content": "اللّهُـمَّ إِنِّـي أَمْسَيْتُ أُشْهِدُك، وَأُشْهِدُ حَمَلَـةَ عَرْشِـك...",
      "count": "1 fois"
    },
    {
      "title": "Après la prière",
      "content": "أستغفر الله، أستغفر الله، أستغفر الله، اللهم أنت السلام ومنك السلام...",
      "count": "3 fois"
    },
    {
      "title": "Avant de dormir",
      "content": "بِاسْمِكَ اللّهُـمَّ أَمـوتُ وَأَحْـيا...",
      "count": "1 fois"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adkar", style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontFamily: 'Lateef',
            fontWeight: FontWeight.bold
        )),
        backgroundColor: Colors.white, // Violet profond
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: adkarList.length,
          itemBuilder: (context, index) {
            final adkar = adkarList[index];

            return Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white,
                elevation: 0,
                child: ExpansionTile(
                  collapsedIconColor: Color(0xFF6A1B9A),
                  iconColor: Color(0xFF6A1B9A),
                  tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  title: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFF6A1B9A).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _getAdkarIcon(adkar['title']!),
                          color: Color(0xFF6A1B9A),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              adkar['title']!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF6A1B9A),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              adkar['count']!,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFFF3E5F5), // Violet très clair
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            adkar['content']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              height: 1.8,
                              fontFamily: 'Lateef',
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.share, color: Color(0xFF6A1B9A)),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.copy, color: Color(0xFF6A1B9A)),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.volume_up, color: Color(0xFF6A1B9A)),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  IconData _getAdkarIcon(String title) {
    if (title.contains("matin")) return Icons.wb_sunny;
    if (title.contains("soir")) return Icons.nightlight_round;
    if (title.contains("prière")) return Icons.mosque;
    if (title.contains("dormir")) return Icons.bedtime;
    return Icons.favorite;
  }
}