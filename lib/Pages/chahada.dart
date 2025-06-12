import 'package:flutter/material.dart';


class ShahadaPage extends StatefulWidget {
  const ShahadaPage({super.key});

  @override
  State<ShahadaPage> createState() => _ShahadaPageState();
}

class _ShahadaPageState extends State<ShahadaPage> {
  final Map<String, Color> languageColors = const {
    'العربية': Color(0xFF8669C4),
    'Français': Color(0xFF7B5DC8),
    'English': Color(0xFF6A4DBA),
    'Español': Color(0xFF5E43A7),
    'Turkish': Color(0xFF4A2F91),
    'Malay': Color(0xFF9374CC),
    'Deutsch': Color(0xFF7E57C2),
  };

  final List<Map<String, String>> allShahadas = [
    {
      'lang': 'العربية',
      'text': 'أشهد أن لا إله إلا الله وأشهد أن محمداً رسول الله',
      'search': 'arabic arabe arabia'
    },
    {
      'lang': 'Français',
      'text': 'J\'atteste qu\'il n\'y a de dieu qu\'Allah et que Muhammad est Son messager',
      'search': 'french francais france'
    },
    {
      'lang': 'English',
      'text': 'I bear witness that there is no god but Allah, and Muhammad is His messenger',
      'search': 'english anglais eng'
    },
    {
      'lang': 'Español',
      'text': 'Atestiguo que no hay más dios que Alá y que Muhammad es su mensajero',
      'search': 'spanish espagnol espanol espana'
    },
    {
      'lang': 'Turkish',
      'text': 'Allah\'tan başka ilah olmadığına ve Muhammed\'in O\'nun elçisi olduğuna şehadet ederim',
      'search': 'turkish turc turquie turkiye'
    },
    {
      'lang': 'Malay',
      'text': 'Aku bersaksi tiada Tuhan melainkan Allah dan Nabi Muhammad itu pesuruh Allah',
      'search': 'malay malais malaysia melayu'
    },
    {
      'lang': 'Deutsch',
      'text': 'Ich bezeuge, dass es keinen Gott außer Allah gibt und dass Muhammad sein Gesandter ist',
      'search': 'german allemand deutsch deutch'
    },
  ];

  List<Map<String, String>> filteredShahadas = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredShahadas = allShahadas;
    searchController.addListener(_filterShahadas);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _filterShahadas() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredShahadas = allShahadas.where((shahada) {
        final langName = shahada['lang']!.toLowerCase();
        final searchTerms = shahada['search']!.toLowerCase();
        return langName.contains(query) || searchTerms.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5FF),
      appBar: AppBar(
        title: const Text('Shahada in Multiple Languages'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher par langue ',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF624D9E)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 20),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredShahadas.length,
              itemBuilder: (context, index) {
                final item = filteredShahadas[index];
                final color = languageColors[item['lang']] ??
                    const Color(0xFF6A4DBA);

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        color.withOpacity(0.1),
                        color.withOpacity(0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: color.withOpacity(0.3),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                              ),
                              //
                            ),
                            const SizedBox(width: 12),
                            Text(
                              item['lang']!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          item['text']!,
                          style: const TextStyle(
                            fontSize: 18,
                            height: 1.5,
                            color: Color(0xFF333333),
                          ),
                          textAlign: item['lang'] == 'العربية'
                              ? TextAlign.right
                              : TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}