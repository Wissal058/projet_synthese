import 'package:flutter/material.dart';
import 'package:projet_synthese/Pages/prayer_times.dart';
import 'package:projet_synthese/Pages/quibla.dart';
import 'package:projet_synthese/Pages/traduction_page.dart';

import 'adkar_page.dart';
import 'audio_library.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //Color(0xFF1A1A1A),

      body: Column(
        children: [
          // 🌃 Section principale avec image de fond
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Hero section avec image de la Mecque
                  Container(
                    height: 280,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            // Date et lieu
                            Spacer(),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "24 Thul-Qi'dah 1446",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "SAFI",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            Spacer(),

                            // Section prière
                            Column(
                              children: [
                                Text(
                                  "Maghrib",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(height: 10),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Icône mosquée
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Icon(
                                        Icons.mosque,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    SizedBox(width: 20),

                                    // Temps principal
                                    Text(
                                      "20:38",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 48,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'monospace',
                                      ),
                                    ),
                                    SizedBox(width: 20),

                                    // Countdown
                                    Text(
                                      "01:12:03",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 16,
                                        fontFamily: 'monospace',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Spacer(),

                            // Citation en arabe
                            Text(
                              "لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 16,
                                height: 1.6,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Séparateur
                  Container(
                    height: 1,
                    color: Colors.grey.withOpacity(0.3),
                  ),

                  // 🎯 Grid des fonctionnalités
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(20),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      childAspectRatio: 0.85,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: [
                        _buildCircularCard("Prayer times", Icons.access_time, () {
                      print("Prayer times clicked");
                      Navigator.push(context, MaterialPageRoute(builder: (_) => PrayerTimesPage()));
                    }),
                        _buildCircularCard("Holy Quran", Icons.menu_book, () {
                          print("Prayer times clicked");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => PrayerTimesPage()));
                        }),
                        _buildCircularCard("Adkar", Icons.favorite, () {
                          print("Prayer times clicked");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => AdkarPage()));
                        }),
                        _buildCircularCard("Misbaha", Icons.grain, () {
                          print("Prayer times clicked");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => PrayerTimesPage()));
                        }),
                        _buildCircularCard("Interpretation and\ntranslation", Icons.translate, () {
                          print("Prayer times clicked");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => AyahTranslationPage()));
                        }),
                        _buildCircularCard("Qibla finder", Icons.explore, () {
                          print("Prayer times clicked");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => QiblaFinderPage()));
                        }),
                        _buildCircularCard("Audio Library", Icons.headphones, () {
                          print("Prayer times clicked");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ElegantAudioLibraryPage()));
                        }),
                        _buildCircularCard("Live TV", Icons.live_tv, () {
                          print("Prayer times clicked");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => PrayerTimesPage()));
                        }),
                        _buildCircularCard("Nearby Mosques", Icons.location_on, () {
                          print("Prayer times clicked");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => PrayerTimesPage()));
                        }),
                        _buildCircularCard("Shahada", Icons.verified, () {
                          print("Prayer times clicked");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => PrayerTimesPage()));
                        }),
                        _buildCircularCard("Names of Allah", Icons.text_format, () {
                          print("Prayer times clicked");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => PrayerTimesPage()));
                        }),
                        _buildCircularCard("Quranic\nSupplications", Icons.handshake, () {
                          print("Prayer times clicked");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => PrayerTimesPage()));
                        }),
                        _buildCircularCard("Community", Icons.group, () {
                          print("Prayer times clicked");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => PrayerTimesPage()));
                        }),
                        _buildCircularCard("Share", Icons.share, () {
                          print("Prayer times clicked");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => PrayerTimesPage()));
                        }),
                        _buildCircularCard("Donations", Icons.attach_money, () {
                          print("Prayer times clicked");
                          Navigator.push(context, MaterialPageRoute(builder: (_) => PrayerTimesPage()));
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularCard(String title, IconData icon, VoidCallback onTap) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple.withOpacity(0.1),
                Color(0xFF1E1E1E)
              ],
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xFF1E1E1E).withOpacity(0.3),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(35),
              onTap: onTap,
              child: Icon(
                icon,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

}
