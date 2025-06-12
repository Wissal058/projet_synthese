import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' show CarouselOptions, CarouselSlider;
import 'package:carousel_slider/carousel_controller.dart' show CarouselController, CarouselSliderController;

import 'package:projet_synthese/Pages/prayer_times.dart';
import 'package:projet_synthese/Pages/quibla.dart';
import 'package:projet_synthese/Pages/traduction_page.dart';
import '../QuranApp.dart';
import 'adkar_page.dart';
import 'misbaha_page.dart';
import 'audio_library.dart';
import 'chahada.dart';
import 'names_of_allah.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0;

  final List<Map<String, String>> dhikrList = [
    {
      'text': 'سبحان الله وبحمده سبحان الله العظيم',
      'translation': '',
      'reference': 'Riyad as-Salihin 1406'
    },
    {
      'text': 'لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير',
      'translation': '',
      'reference': 'Riyad as-Salihin 1413'
    },
    {
      'text': 'من قال لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير، عشر مرات، كان كمن أعتق أربعة أنفس',
      'translation': '',
      'reference': 'Bukhari 3293'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F5F2),
      drawer: _buildDrawer(context),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A3E72),
        elevation: 0,
        title: Text('My Islamic App', style: TextStyle(fontWeight: FontWeight.w300)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Section Date/Lieu
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Color(0xFF1A3E72),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      '24 Thul-Qi\'dah 1446',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'SAFI, Morocco',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            // Carte Carrousel Dhikr/Hadith
            Padding(
              padding: EdgeInsets.all(20),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Image avec effet de superposition
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1542816417-09836749781e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          right: 20,
                          child: Text(
                            'Dhikr du Jour',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Carrousel Dhikr
                    CarouselSlider(
                      carouselController: _carouselController,
                      items: dhikrList.map((dhikr) {
                        return Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                dhikr['text']!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  height: 1.8,
                                  color: Color(0xFF1A3E72),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                dhikr['translation']!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                dhikr['reference']!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 8),
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),

                    // Indicateurs de position
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: dhikrList.map((dhikr) {
                        int index = dhikrList.indexOf(dhikr);
                        return Container(
                          width: 8,
                          height: 8,
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? Color(0xFF1A3E72)
                                : Colors.grey.withOpacity(0.4),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),

            // Carte Prochaine Prière
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Prochaine Prière',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            'Temps restant: 01:12:03',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(Icons.mosque, color: Color(0xFF1A3E72), size: 30),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Maghrib',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Prière du coucher du soleil',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            '20:38',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A3E72),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF1A3E72),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mosque, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    'Islamic App',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          _drawerItem(Icons.access_time, 'Prayer Times', () => _navigateTo(context, PrayerTimesPage())),
          _drawerItem(Icons.menu_book, 'Holy Quran', () => _navigateTo(context, SurahListScreen())),
          _drawerItem(Icons.favorite, 'Adkar', () => _navigateTo(context, AdkarPage())),
          _drawerItem(Icons.grain, 'Misbaha', () => _navigateTo(context, MisbahaPage())),
          _drawerItem(Icons.translate, 'Translation', () => _navigateTo(context, AyahTranslationPage())),
          _drawerItem(Icons.explore, 'Qibla Finder', () => _navigateTo(context, QiblaFinderPage())),
          _drawerItem(Icons.headphones, 'Audio Library', () => _navigateTo(context, ElegantAudioLibraryPage())),
          _drawerItem(Icons.verified, 'Shahada', () => _navigateTo(context, ShahadaPage())),
          _drawerItem(Icons.text_format, 'Names of Allah', () => _navigateTo(context, NamesOfAllahApp())),
          Divider(),
          _drawerItem(Icons.settings, 'Settings', () {}),
          _drawerItem(Icons.share, 'Share App', () {}),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF1A3E72)),
      title: Text(title),
      onTap: onTap,
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pop(context); // Ferme le drawer
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }
}