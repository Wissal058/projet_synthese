import 'package:flutter/material.dart';

import 'Pages/adkar_page.dart';
import 'Pages/audio_library.dart';
import 'Pages/home_page.dart';
import 'Pages/prayer_times.dart';
import 'Pages/quibla.dart';
import 'Pages/traduction_page.dart';
import 'Pages/zaquat_al_mal.dart';
import 'Pages/settings_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic Prayer Times',
      debugShowCheckedModeBanner: false,
      /*theme: ThemeData.light().copyWith(
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
      ),*/
      home: HomePage(),
    );
  }
}

