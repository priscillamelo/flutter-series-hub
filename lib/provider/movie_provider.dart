import 'package:flutter/material.dart';

import 'dart:collection';
import 'package:flutter_journal_moviesandseries/models/abas/assistir.dart';

import '../models/filme.dart';

class MovieProvider with ChangeNotifier {
  //final Database db = ;
  final List<Filme> _listMoviesAssistir = Assistir().listMovies;
  //final List<Serie> _listSeriesAssistir = Assistir().listSeries;

  List<Filme> get getAllMovies => UnmodifiableListView(_listMoviesAssistir);

  saveMovie(Filme movie) {
    _listMoviesAssistir.add(movie);
    notifyListeners();
  }

  removeMovie(Filme movie) {
    _listMoviesAssistir.remove(movie);
    notifyListeners();
  }
}
/*
Future<AppDatabase> getDatabase() async {
  final database =
  await $FloorAppDatabase.databaseBuilder('flutter_database.db').build();



  return database;
}*/
