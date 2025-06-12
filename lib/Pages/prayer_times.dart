import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

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
  Map<String, String> prayerTimes = {
    "Fajr": "...",
    "Sunrise": "...",
    "Dhuhr": "...",
    "Asr": "...",
    "Maghrib": "...",
    "Isha": "...",
  };

  String nextPrayer = "";
  String timeRemaining = "Chargement...";
  bool _isDarkMode = false;
  bool _isLoading = true;
  Timer? _timer;
  DateTime? _nextPrayerTime;

  @override
  void initState() {
    super.initState();
    _fetchPrayerTimes();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateTimeRemaining();
    });
  }

  Future<void> _fetchPrayerTimes() async {
    try {
      Position? position;

      try {
        // Essayer d'obtenir la position actuelle
        position = await _getCurrentPosition();
      } catch (locationError) {
        print('Erreur de géolocalisation: $locationError');
        // Utiliser les coordonnées de Marrakesh par défaut
        position = null;
      }

      // Coordonnées par défaut (Marrakesh, Maroc)
      double latitude = position?.latitude ?? 31.6295;
      double longitude = position?.longitude ?? -7.9811;

      // Appel API pour récupérer les heures de prière
      final response = await http.get(
        Uri.parse(
            'http://api.aladhan.com/v1/timings?latitude=$latitude&longitude=$longitude&method=2'
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final timings = data['data']['timings'];

        setState(() {
          prayerTimes = {
            "Fajr": _formatTime(timings['Fajr']),
            "Sunrise": _formatTime(timings['Sunrise']),
            "Dhuhr": _formatTime(timings['Dhuhr']),
            "Asr": _formatTime(timings['Asr']),
            "Maghrib": _formatTime(timings['Maghrib']),
            "Isha": _formatTime(timings['Isha']),
          };
          _isLoading = false;
        });

        _findNextPrayer();

        // Afficher un message si on utilise la localisation par défaut
        if (position == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Utilisation de la localisation par défaut (Marrakesh)'),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 3),
            ),
          );
        }
      } else {
        throw Exception('Erreur API: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        // Utiliser des heures par défaut en cas d'erreur
        prayerTimes = {
          "Fajr": "05:30",
          "Sunrise": "07:00",
          "Dhuhr": "13:15",
          "Asr": "16:30",
          "Maghrib": "19:00",
          "Isha": "20:30",
        };
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur de chargement. Heures par défaut utilisées.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 4),
        ),
      );

      _findNextPrayer();
      print('Erreur lors du chargement des heures de prière: $e');
    }
  }

  Future<Position> _getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Demander à l'utilisateur d'activer la localisation
      bool opened = await Geolocator.openLocationSettings();
      if (!opened) {
        throw Exception('Les services de localisation sont désactivés');
      }

      // Vérifier à nouveau après avoir ouvert les paramètres
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Les services de localisation sont toujours désactivés');
      }
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Permission de localisation refusée');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Permission de localisation refusée définitivement. Veuillez l\'activer dans les paramètres.');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
      timeLimit: Duration(seconds: 10),
    );
  }

  String _formatTime(String time) {
    // Convertir le format 24h en format lisible
    List<String> parts = time.split(':');
    return '${parts[0]}:${parts[1]}';
  }

  void _findNextPrayer() {
    DateTime now = DateTime.now();
    DateTime? nextTime;
    String nextPrayerName = "";

    for (String prayer in prayerTimes.keys) {
      String timeStr = prayerTimes[prayer]!;
      if (timeStr == "...") continue;

      List<String> timeParts = timeStr.split(':');
      DateTime prayerDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(timeParts[0]),
        int.parse(timeParts[1]),
      );

      // Si l'heure de prière est passée aujourd'hui, ajouter un jour
      if (prayerDateTime.isBefore(now)) {
        prayerDateTime = prayerDateTime.add(Duration(days: 1));
      }

      if (nextTime == null || prayerDateTime.isBefore(nextTime)) {
        nextTime = prayerDateTime;
        nextPrayerName = prayer;
      }
    }

    setState(() {
      nextPrayer = nextPrayerName;
      _nextPrayerTime = nextTime;
    });
  }

  void _updateTimeRemaining() {
    if (_nextPrayerTime == null) return;

    DateTime now = DateTime.now();
    Duration difference = _nextPrayerTime!.difference(now);

    if (difference.isNegative) {
      _findNextPrayer();
      return;
    }

    int hours = difference.inHours;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;

    setState(() {
      timeRemaining = "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    });
  }

  double _getProgressValue() {
    if (_nextPrayerTime == null) return 0.0;

    DateTime now = DateTime.now();
    Duration totalDuration = Duration(hours: 24);
    Duration elapsed = Duration(
      hours: now.hour,
      minutes: now.minute,
      seconds: now.second,
    );

    return elapsed.inSeconds / totalDuration.inSeconds;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Heures de Prière"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {
              _showLocationDialog();
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              _fetchPrayerTimes();
            },
          ),
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
      body: _isLoading
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text("Chargement des heures de prière..."),
          ],
        ),
      )
          : Padding(
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
                        nextPrayer.isNotEmpty ? prayerTimes[nextPrayer]! : "--:--",
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
                    value: _getProgressValue(),
                    backgroundColor: Colors.white.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Temps restant: $timeRemaining",
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
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
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
                          if (isNext)
                            Text(
                              timeRemaining,
                              style: TextStyle(
                                fontSize: 10,
                                color: theme.primaryColor.withOpacity(0.7),
                              ),
                            ),
                        ],
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

  void _showLocationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Localisation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Pour des heures de prière précises, activez la géolocalisation dans les paramètres de votre appareil.'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Geolocator.openLocationSettings();
                },
                child: Text('Ouvrir les paramètres'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Fermer'),
            ),
          ],
        );
      },
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