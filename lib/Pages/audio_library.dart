import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ElegantAudioLibraryPage extends StatefulWidget {
  @override
  _ElegantAudioLibraryPageState createState() => _ElegantAudioLibraryPageState();
}

class _ElegantAudioLibraryPageState extends State<ElegantAudioLibraryPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentlyPlaying;
  bool _isPlaying = false;

  final List<Map<String, String>> audioList = [
    {
      'title': 'Sourate Al-Fatiha',
      'reciter': 'Mishary Al-Afasy',
      'duration': '3:45',
      'url': 'https://www.example.com/audio/fatiha.mp3',
    },
    {
      'title': 'Sourate Al-Baqarah (1-5)',
      'reciter': 'Abdul Basit',
      'duration': '7:22',
      'url': 'https://www.example.com/audio/baqarah1.mp3',
    },
    {
      'title': 'Doua du matin',
      'reciter': 'Yasser Al-Dosari',
      'duration': '2:15',
      'url': 'https://www.example.com/audio/doua_matin.mp3',
    },
  ];

  void _playAudio(String url) async {
    if (_currentlyPlaying == url) {
      await _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
      });
    } else {
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        _currentlyPlaying = url;
        _isPlaying = true;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color(0xFF6A1B9A); // Violet profond
    final Color accentColor = Color(0xFFE1BEE7);  // Violet clair

    return Scaffold(
      appBar: AppBar(
        title: Text('Bibliothèque Audio',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Lateef',
            fontSize: 28,
          ),
        ),
        backgroundColor: Colors.white,
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
        child: Column(
          children: [
            // Player en cours (si un audio est sélectionné)
            if (_currentlyPlaying != null)
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: primaryColor.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.music_note, color: primaryColor),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            audioList.firstWhere((a) => a['url'] == _currentlyPlaying)['title']!,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                          ),
                          Text(
                            audioList.firstWhere((a) => a['url'] == _currentlyPlaying)['reciter']!,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                        color: primaryColor,
                        size: 36,
                      ),
                      onPressed: () => _playAudio(_currentlyPlaying!),
                    ),
                  ],
                ),
              ),

            // Liste des audios
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: audioList.length,
                itemBuilder: (context, index) {
                  final audio = audioList[index];
                  final isCurrent = _currentlyPlaying == audio['url'];

                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: isCurrent ? accentColor.withOpacity(0.3) : Colors.white,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () => _playAudio(audio['url']!),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.library_music,
                                  color: primaryColor,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      audio['title']!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '${audio['reciter']!} • ${audio['duration']}',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                isCurrent && _isPlaying
                                    ? Icons.pause_circle_filled
                                    : Icons.play_circle_filled,
                                color: primaryColor,
                                size: 32,
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
          ],
        ),
      ),
    );
  }
}