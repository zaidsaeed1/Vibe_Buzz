import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:vibe_buzz1/data/models/track.dart'; // Import your Track model

class TrackDatabase {
  static final TrackDatabase instance = TrackDatabase._init();

  static Database? _database;

  TrackDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('tracks.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    // Open the database and create the table if it doesn't exist.
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    const idType = 'TEXT PRIMARY KEY';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    // Creating the tracks table
    await db.execute('''
      CREATE TABLE tracks (
        id $idType, 
        name $textType, 
        artist $textType, 
        albumArt $textType, 
        album TEXT, 
        duration $integerType
      )
    ''');
  }

  // Function to insert track into the database
  Future<void> insertTrack(Track track) async {
    final db = await instance.database;
    try {
      await db.insert('tracks', track.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      print('Error inserting track: $e');
    }
  }

  // Fetch all tracks from the database
  Future<List<Track>> getAllTracks() async {
    final db = await instance.database;
    final result = await db.query('tracks');
    return result.map((json) => Track.fromJson(json)).toList();
  }
}
