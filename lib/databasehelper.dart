import 'package:project/release_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('music.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const albumTable = '''
    CREATE TABLE albums (
      id TEXT PRIMARY KEY,
      title TEXT,
      artist TEXT,
      thumb TEXT,
      previewUrl TEXT
    )
    ''';

    await db.execute(albumTable);
  }

  Future<void> insertAlbum(Album album) async {
    final db = await instance.database;

    await db.insert(
      'albums',
      album.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteAlbum(String id) async {
    final db = await instance.database;

    await db.delete(
      'albums',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Album>> getSavedAlbums() async {
    final db = await instance.database;

    final result = await db.query('albums');

    return result.map((json) => Album.fromJson(json)).toList();
  }
}

extension on Album {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'thumb': thumb,
      'previewUrl': previewUrl,
    };
  }
}