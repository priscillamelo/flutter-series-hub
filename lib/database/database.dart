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
      version: 2,
      onCreate: _onCreate,
    );

    return database;
  }

  _onCreate(db, version) async {
    await db.execute(_sqlTableMovie);
    await db.execute(_sqlTableSerie);
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
    ${Serie.kCURRENTSEASONSERIECOLUMN} INTEGER,
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
