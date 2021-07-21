import 'package:path/path.dart';
import 'package:song_voter/app/data/models/party.dart';
import 'package:sqflite/sqflite.dart';

class PartyDatabase {
  static final PartyDatabase instance = PartyDatabase._init();

  static Database? _database;

  PartyDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('party.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE IF NOT EXISTS `party` ( 
  `_id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `private` TINYINT NOT NULL,
  `createdAt` VARCHAR(20) NOT NULL
  );
''');
  }

  Future<Party> create(Party party) async {
    final db = await instance.database;

    final id = await db.insert('party', party.toJson());
    return party.copy(id: id);
  }

  Future<Party> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'party',
      columns: PartyFields.values,
      where: '${PartyFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Party.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Party>> readAllParties() async {
    final db = await instance.database;

    final result = await db.query('party');

    return result.map((json) => Party.fromJson(json)).toList();
  }

  Future<int> update(Party note) async {
    final db = await instance.database;

    return db.update(
      'party',
      note.toJson(),
      where: '${PartyFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      'party',
      where: '${PartyFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
