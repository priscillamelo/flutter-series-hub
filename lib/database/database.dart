import 'package:flutter_journal_moviesandseries/services/repository/serie_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  // Construtor nomeado privado
  DB._internalConstructor();

  // Cria uma instância privada constante
  static final DB instanceDatabase = DB._internalConstructor();

  static Database? _database;

  static const String _kDATABASENAME = "journal-digital_db.db";

  Future<Database> get getDatabase async {
    if (_database != null) return _database!;

    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(
      databaseDirPath,
      DB._kDATABASENAME,
    );
    final database = await openDatabase(
      databasePath,
      version: 2,
      onCreate: _onCreate,
    );

    return database;
  }

  _onCreate(db, version) async {
    await db.execute(_sqlTableSerie);
  }

  final String _sqlTableSerie = SerieRepository().sqlTableSerie;
}
