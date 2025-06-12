class Verse {
  final int number;
  final String text;
  final int surahNumber;
  final int ayahNumber;

  Verse({
    required this.number,
    required this.text,
    required this.surahNumber,
    required this.ayahNumber,
  });

  factory Verse.fromJson(Map<String, dynamic> json, int surahNumber) {
    return Verse(
      number: json['number'] ?? 0,
      text: json['text'] ?? '',
      surahNumber: surahNumber,
      ayahNumber: json['numberInSurah'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'text': text,
      'surahNumber': surahNumber,
      'ayahNumber': ayahNumber,
    };
  }

  factory Verse.fromMap(Map<String, dynamic> map) {
    return Verse(
      number: map['number'],
      text: map['text'],
      surahNumber: map['surahNumber'],
      ayahNumber: map['ayahNumber'],
    );
  }
}
