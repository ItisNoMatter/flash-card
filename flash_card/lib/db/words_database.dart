import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flash_card/model/word.dart';

class WordsDatabase{
  static final WordsDatabase instance = WordsDatabase._init();

  static Database? _database;

  WordsDatabase._init();

  Future <Database> get database async {
    _database = await _initDatabase('card_db');
    return database;
  }

  Future <Database> _initDatabase(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);
    return openDatabase(path,version: 1,onCreate: _createDB);
  }
  Future _createDB(Database db,int version) async{
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $tableWords (
        ${WordFields.id} $idType ,
        ${WordFields.heads} $textType ,
        ${WordFields.tails} $textType 
      )
    ''');
  }
  Future <void> create(Word word) async{
    final db = await instance.database;
    await db.insert(tableWords, word.toJson());
  }
  Future <Word> readWord(int id) async{
    final db = await instance.database;

    final maps = await db.query(
      tableWords,
      columns: WordFields.varues,
      where: '${WordFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Word.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }
}