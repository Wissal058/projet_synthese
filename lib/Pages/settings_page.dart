import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  String selectedLanguage = 'Français';
  final Color _primaryColor = Color(0xFF550783); // Violet profond
  final Color _accentColor = Color(0xFF5D2376);  // Violet clair

  final List<String> languages = ['Français', 'Arabe', 'Anglais'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text("Paramètres", // "Paramètres" en arabe
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Lateef',
            fontSize: 28,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        // Suppression des coins arrondis
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.zero),
        ),
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
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            // Section Langue
            _buildSettingCard(
              icon: Icons.language,
              title: "Langue",
              child: DropdownButtonFormField<String>(
                value: selectedLanguage,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                items: languages.map((lang) {
                  return DropdownMenuItem(
                    value: lang,
                    child: Text(lang),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value!;
                  });
                },
                dropdownColor: Colors.white,
                icon: Icon(Icons.arrow_drop_down, color: _primaryColor),
              ),
            ),

            SizedBox(height: 16),

            // Section Thème
            _buildSettingCard(
              icon: Icons.brightness_6,
              title: "Mode Sombre",
              child: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
                activeColor: _primaryColor,
                activeTrackColor: _accentColor,
              ),
            ),

            SizedBox(height: 16),

            // Section À propos
            _buildSettingCard(
              icon: Icons.info_outline,
              title: "À propos",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Version 1.0.0",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 4),
                  Text("Développé par VotreNom",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Bouton de déconnexion
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implémenter la déconnexion
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.red),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 10),
                    Text("Déconnexion"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: _primaryColor),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.purple
                    ),
                  ),
                  SizedBox(height: 8),
                  child,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}