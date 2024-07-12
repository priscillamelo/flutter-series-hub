import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/models/filme.dart';

import '../../database/filme_helper.dart';

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

  FilmeHelper movieHelper = FilmeHelper();
  FilmeRepository() {
    _initRepository();
  }

  _initRepository() async {
    await getAllMovies();
  }

  Future<List<Filme>> getAllMovies() async {
    List listMapMovies = await movieHelper.getAllMovies();
    List<Filme> listMovies = [];

    for (Map i in listMapMovies) {
      listMovies.add(Filme.fromMap(i));
    }

    notifyListeners();
    return listMovies;
  }

  Future<void> addFilme(Filme filme) async {
    movieHelper.addFilme(filme);
  }

  Future<void> updateMovie(Filme filme) async {
    await movieHelper.updateMovie(filme);
    notifyListeners();
  }

  Future<dynamic> getFilmeById(int id) async {
    Filme? filme = await movieHelper.getMovieById(id);

    return filme;
  }

  Future<int> deleteMovie(int id) async {
    late final int numberRowsAffected;
    numberRowsAffected = await movieHelper.delete(id);
    notifyListeners();
    return numberRowsAffected;
  }
}
