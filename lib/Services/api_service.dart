import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/PrayerTime.dart';

Future<PrayerTime> fetchPrayerTimes() async {
  final url = Uri.parse(
    'https://api.aladhan.com/v1/timingsByCity?city=Casablanca&country=Morocco&method=2',
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return PrayerTime.fromJson(json);
  } else {
    throw Exception('Erreur lors de la récupération des horaires de prière');
  }
}
