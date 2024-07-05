import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/database/database.dart';
import 'package:flutter_journal_moviesandseries/models/filme.dart';

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

  late DB movieDatabase;
  FilmeRepository() {
    _initRepository();
  }

  _initRepository() async {
    await getAllMovies();
  }

  Future<List<Filme>> getAllMovies() async {
    movieDatabase = DB.instanceDatabase;

    List listMapMovies = await movieDatabase.getAllMovies();
    List<Filme> listMovies = [];

    for (Map i in listMapMovies) {
      listMovies.add(Filme.fromMap(i));
    }

    notifyListeners();
    return listMovies;
  }

  Future<void> addFilme(Filme filme) async {
    movieDatabase = DB.instanceDatabase;
    movieDatabase.addFilme(filme);
  }

  Future<void> updateMovie(Filme filme) async {
    debugPrint("debug no banco: ${filme.titulo}");
    movieDatabase = DB.instanceDatabase;

    await movieDatabase.updateMovie(filme);
    notifyListeners();
  }

  Future<dynamic> getFilmeById(int id) async {
    movieDatabase = DB.instanceDatabase;

    Filme? filme = await movieDatabase.getMovieById(id);

    return filme;
  }

  Future<int> deleteMovie(int id) async {
    movieDatabase = DB.instanceDatabase;
    late final int numberRowsAffected;
    numberRowsAffected = await movieDatabase.delete(id);
    notifyListeners();
    return numberRowsAffected;
  }
}
