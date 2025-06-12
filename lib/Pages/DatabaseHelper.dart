import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import '../Surah.dart';
import 'Verse.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static sqflite.Database? _database;

  DatabaseHelper._internal();

  Future<sqflite.Database?> get database async {
    return _database ??= await _initDb();
  }

  Future<sqflite.Database> _initDb() async {
    final dbPath = await sqflite.getDatabasesPath();
    final path = join(dbPath, 'quran.db');

    return await sqflite.openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await _createTables(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('''
            CREATE TABLE verses (
              number INTEGER PRIMARY KEY,
              text TEXT,
              surahNumber INTEGER,
              ayahNumber INTEGER
            )
          ''');
        }
      },
    );
  }

  Future<void> _createTables(sqflite.Database db) async {
    await db.execute('''
      CREATE TABLE surahs (
        number INTEGER PRIMARY KEY,
        name TEXT,
        englishName TEXT,
        revelationType TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE verses (
        number INTEGER PRIMARY KEY,
        text TEXT,
        surahNumber INTEGER,
        ayahNumber INTEGER
      )
    ''');
  }

  Future<void> insertSurahs(List<Surah> surahs) async {
    final db = await database;
    for (var surah in surahs) {
      await db!.insert(
        'surahs',
        surah.toMap(),
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Surah>> getSurahs() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query('surahs');
    debugPrint('📥 Données récupérées depuis SQLite: $maps');
    return List.generate(maps.length, (i) => Surah.fromMap(maps[i]));
  }

  Future<bool> isEmpty() async {
    final db = await database;
    final result = sqflite.Sqflite.firstIntValue(await db!.rawQuery('SELECT COUNT(*) FROM surahs'));
    return result == 0;
  }

  Future<void> insertVerses(List<Verse> verses) async {
    final db = await database;
    for (var verse in verses) {
      await db!.insert(
        'verses',
        verse.toMap(),
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Verse>> getVersesBySurah(int surahNumber) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(
      'verses',
      where: 'surahNumber = ?',
      whereArgs: [surahNumber],
      orderBy: 'ayahNumber ASC',
    );
    return List.generate(maps.length, (i) => Verse.fromMap(maps[i]));
  }

  Future<bool> hasVersesForSurah(int surahNumber) async {
    final db = await database;
    final count = sqflite.Sqflite.firstIntValue(await db!.rawQuery(
      'SELECT COUNT(*) FROM verses WHERE surahNumber = ?',
      [surahNumber],
    ));
    return (count ?? 0) > 0;
  }
}
