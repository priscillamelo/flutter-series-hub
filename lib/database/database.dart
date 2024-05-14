import 'package:flutter_journal_moviesandseries/models/filme.dart';
import 'package:flutter_journal_moviesandseries/models/serie.dart';
import 'package:flutter_journal_moviesandseries/services/repository/filme_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  // Construtor nomeado privado
  DB._internal();

  // Cria uma instância privada constante
  static final DB _instanceDatabase = DB._internal();

  // Método de fábrica para retornar a mesma instância
  factory DB() {
    return _instanceDatabase;
  }

  static const String _kDATABASENAME = "journal-digital.db";

  static Database? _database;

  get getDatabase async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    String path = await getDatabasesPath();

    return await openDatabase(
      join(
        path,
        DB._kDATABASENAME,
      ),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    await db.execute(_sqlTableMovie);
    await db.execute(_sqlTableSerie);
  }

  //final String _sqlTableMovie = FilmeRepository().sqlTableMovie;
  String get _sqlTableMovie => '''
  CREATE TABLE ${Filme.kMOVIETABLE}(
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
    ${Filme.kTABNAMEMOVIECOLUMN} TEXT,
  )
''';
  String get _sqlTableSerie => '''
  CREATE TABLE ${Serie.kSERIETABLE}(
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
    ${Serie.kTABNAMESERIECOLUMN} TEXT,
  )
''';
}
