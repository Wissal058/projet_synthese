import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic Prayer Times',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF4CAF50),
        colorScheme: ColorScheme.light().copyWith(
          secondary: Color(0xFF8BC34A),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0D6E3D),
        colorScheme: ColorScheme.dark().copyWith(
          secondary: Color(0xFF0A4D2E),
        ),
        cardColor: Color(0xFF1E1E1E),
      ),
      home: PrayerTimesPage(),
    );
  }
}

class PrayerTimesPage extends StatefulWidget {
  @override
  _PrayerTimesPageState createState() => _PrayerTimesPageState();
}

class _PrayerTimesPageState extends State<PrayerTimesPage> {
  final Map<String, String> prayerTimes = {
    "Fajr": "04:38",
    "Sunrise": "06:15",
    "Dhuhr": "13:12",
    "Asr": "16:47",
    "Maghrib": "19:22",
    "Isha": "20:45",
  };

  final String nextPrayer = "Dhuhr";
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Heures de Prière"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Section Prochaine Prière - Stylisée
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.primaryColor,
                    theme.colorScheme.secondary,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "PROCHAINE PRIÈRE",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 12,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    nextPrayer,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Icon(
                        _getPrayerIcon(nextPrayer),
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(width: 16),
                      Text(
                        prayerTimes[nextPrayer]!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'RobotoMono',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: 0.7,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Temps restant: 01:24:38",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            Expanded(
              child: ListView.builder(
                itemCount: prayerTimes.length,
                itemBuilder: (context, index) {
                  String prayer = prayerTimes.keys.elementAt(index);
                  String time = prayerTimes[prayer]!;
                  bool isNext = prayer == nextPrayer;

                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: isNext
                          ? theme.primaryColor.withOpacity(0.1)
                          : theme.cardColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: _isDarkMode
                          ? null
                          : [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: isNext
                              ? theme.primaryColor.withOpacity(0.2)
                              : theme.colorScheme.background.withOpacity(0.05),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _getPrayerIcon(prayer),
                          color: isNext
                              ? theme.primaryColor
                              : theme.iconTheme.color,
                        ),
                      ),
                      title: Text(
                        prayer,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: isNext
                              ? theme.primaryColor
                              : theme.textTheme.bodyLarge?.color,
                        ),
                      ),
                      trailing: Text(
                        time,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'RobotoMono',
                          color: isNext
                              ? theme.primaryColor
                              : theme.textTheme.bodyLarge?.color,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getPrayerIcon(String prayerName) {
    switch (prayerName) {
      case "Fajr":
        return Icons.nights_stay;
      case "Sunrise":
        return Icons.wb_sunny;
      case "Dhuhr":
        return Icons.brightness_high;
      case "Asr":
        return Icons.brightness_medium;
      case "Maghrib":
        return Icons.brightness_low;
      case "Isha":
        return Icons.nightlight_round;
      default:
        return Icons.access_time;
    }
  }
}