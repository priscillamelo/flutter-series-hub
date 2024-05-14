import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/database/database.dart';
import 'package:flutter_journal_moviesandseries/models/filme.dart';
import 'package:sqflite/sqflite.dart';

class FilmeRepository extends ChangeNotifier {
  String get sqlTableMovie => '''
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

  late Database movieDatabase;

  FilmeRepository() {
    _initRepository();
  }

  _initRepository() async {
    await _getListMovies();
  }

  _getListMovies() async {
    movieDatabase = await DB().getDatabase;

    List listMapMovies = await movieDatabase.query(Filme.kMOVIETABLE);
    List<Filme> listMovies = [];

    for (Map i in listMapMovies) {
      listMovies.add(Filme.fromMap(i));
    }
    notifyListeners();
  }

  Future<List> getAllMovies() async {
    movieDatabase = await DB().getDatabase;

    List listMapMovies = await movieDatabase.query(Filme.kMOVIETABLE);
    List<Filme> listMovies = [];

    for (Map i in listMapMovies) {
      listMovies.add(Filme.fromMap(i));
    }

    //notifyListeners();
    return listMovies;
  }

  Future<void> addFilme(Filme filme) async {
    movieDatabase = await DB().getDatabase;

    await movieDatabase.insert(Filme.kMOVIETABLE, filme.toMap());
  }

  Future<void> updateMovie(Filme filme) async {
    movieDatabase = await DB().getDatabase;

    await movieDatabase.update(Filme.kMOVIETABLE, filme.toMap(),
        where: "${Filme.kIDMOVIECOLUMN} = ?", whereArgs: [filme.id]);
  }

  Future<Filme?> getFilme(int id) async {
    movieDatabase = await DB().getDatabase;

    List<Map> maps = await movieDatabase.query(Filme.kMOVIETABLE,
        columns: [
          Filme.kIDMOVIECOLUMN,
          Filme.kTITLEMOVIECOLUMN,
          Filme.kDIRECTORMOVIECOLUMN,
          Filme.kRELEASEYEARMOVIECOLUMN,
          Filme.kGENREMOVIECOLUMN,
          Filme.kRATINGMOVIECOLUMN
        ],
        where: "${Filme.kIDMOVIECOLUMN} = ?",
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Filme.fromMap(maps.first);
    }
    return null;
  }
}
