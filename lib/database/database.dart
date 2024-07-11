// ignore_for_file: avoid_print

import 'package:flutter_journal_moviesandseries/models/filme.dart';
import 'package:flutter_journal_moviesandseries/models/serie.dart';
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
      version: 1,
      onCreate: _onCreate,
    );

    return database;
  }

  _onCreate(db, version) async {
    await db.execute(_sqlTableMovie);
    await db.execute(_sqlTableSerie);
  }

  void addFilme(Filme filme) async {
    final db = await getDatabase;
    db.insert(Filme.kMOVIETABLE, filme.toMap());
  }

  Future<List> getAllMovies() async {
    final Database db = await getDatabase;
    final List listAllMovies = await db.query(Filme.kMOVIETABLE);
    return listAllMovies;
  }

  Future<Filme?> getMovieById(int idMovie) async {
    final Database db = await getDatabase;
    final List<Map> filmeMaps = await db.query(Filme.kMOVIETABLE,
        where: '${Filme.kIDMOVIECOLUMN} = ?', whereArgs: [idMovie]);

    return filmeMaps.isNotEmpty ? Filme.fromMap(filmeMaps.first) : null;
  }

  Future<int> updateMovie(Filme filme) async {
    final Database db = await getDatabase;
    late final int numberRowsAffected;

    numberRowsAffected = await db.update(Filme.kMOVIETABLE, filme.toMap(),
        where: '${Filme.kIDMOVIECOLUMN} = ?',
        whereArgs: [filme.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
    return numberRowsAffected;
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase;
    late final int numberRowsAffected;
    numberRowsAffected = await db.delete(
      Filme.kMOVIETABLE,
      where: '${Filme.kIDMOVIECOLUMN} = ?',
      whereArgs: [id],
    );
    return numberRowsAffected;
  }

//final String _sqlTableMovie = FilmeRepository().sqlTableMovie;
  String get _sqlTableMovie => '''
  CREATE TABLE ${Filme.kMOVIETABLE} (
    ${Filme.kIDMOVIECOLUMN} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${Filme.kTITLEMOVIECOLUMN} TEXT,
    ${Filme.kDIRECTORMOVIECOLUMN} TEXT,
    ${Filme.kGENREMOVIECOLUMN} TEXT,
    ${Filme.kCASTMOVIECOLUMN} TEXT,
    ${Filme.kRELEASEYEARMOVIECOLUMN} INTEGER,
    ${Filme.kSTREAMINGMOVIECOLUMN} TEXT,
    ${Filme.kSYNOPSISMOVIECOLUMN} TEXT,
    ${Filme.kPOSTERMOVIECOLUMN} TEXT,
    ${Filme.kRATINGMOVIECOLUMN} REAL,
    ${Filme.kTABNAMEMOVIECOLUMN} TEXT
  )
''';
  String get _sqlTableSerie => '''
  CREATE TABLE ${Serie.kSERIETABLE} (
    ${Serie.kIDSERIECOLUMN} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${Serie.kTITLESERIECOLUMN} TEXT,
    ${Serie.kDIRECTORSERIECOLUMN} TEXT,
    ${Serie.kGENRESERIECOLUMN} TEXT,
    ${Serie.kCASTSERIECOLUMN} TEXT,
    ${Serie.kRELEASEYEARSERIECOLUMN} INTEGER,
    ${Serie.kCOMPLETEDYEARSERIECOLUMN} INTEGER,
    ${Serie.kSTREAMINGSERIECOLUMN} TEXT,
    ${Serie.kSYNOPSISSERIECOLUMN} TEXT,
    ${Serie.kPOSTERSERIECOLUMN} TEXT,
    ${Serie.kRATINGSERIECOLUMN} REAL,
    ${Serie.kSEASONSSERIECOLUMN} INTEGER,
    ${Serie.kFINISHDATESERIECOLUMN} TEXT,
    ${Serie.kTABNAMESERIECOLUMN} TEXT
  )
''';
}
