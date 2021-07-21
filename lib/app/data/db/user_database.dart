import 'package:path/path.dart';
import 'package:song_voter/app/data/models/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabase {
  static final UserDatabase instance = UserDatabase._init();

  static Database? _database;

  static const String _dbName = 'user';

  UserDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('$_dbName.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE IF NOT EXISTS `$_dbName` ( 
  `$UserFields.id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `$UserFields.username` VARCHAR(255) NOT NULL,
  `$UserFields.googleId` INTEGER,
  `$UserFields.appleId` INTEGER,
  `$UserFields.guestId` INTEGER
  );
''');
  }

  Future<User> create(User user) async {
    final db = await instance.database;

    await db.insert(_dbName, user.toJson());
    return user;
  }

  Future<User> readUser(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      _dbName,
      columns: UserFields.values,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<User>> readAllUsers() async {
    final db = await instance.database;

    final result = await db.query(_dbName);

    return result.map((json) => User.fromJson(json)).toList();
  }

  Future<int> update(User user) async {
    final db = await instance.database;

    return db.update(
      _dbName,
      user.toJson(),
      where: '${UserFields.id} = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      'party',
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
