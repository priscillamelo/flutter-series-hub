import 'package:sqflite/sqflite.dart';

import '../models/filme.dart';
import 'database.dart';

class FilmeHelper {
  final DB _database = DB.instanceDatabase;

  void addFilme(Filme filme) async {
    final Database db = await _database.getDatabase;

    db.insert(Filme.kMOVIETABLE, filme.toMap());
  }

  Future<List> getAllMovies() async {
    final Database db = await _database.getDatabase;
    final List listAllMovies = await db.query(Filme.kMOVIETABLE);
    return listAllMovies;
  }

  Future<Filme?> getMovieById(int idMovie) async {
    final Database db = await _database.getDatabase;
    final List<Map> filmeMaps = await db.query(Filme.kMOVIETABLE,
        where: '${Filme.kIDMOVIECOLUMN} = ?', whereArgs: [idMovie]);

    return filmeMaps.isNotEmpty ? Filme.fromMap(filmeMaps.first) : null;
  }

  Future<int> updateMovie(Filme filme) async {
    final Database db = await _database.getDatabase;
    late final int numberRowsAffected;

    numberRowsAffected = await db.update(Filme.kMOVIETABLE, filme.toMap(),
        where: '${Filme.kIDMOVIECOLUMN} = ?',
        whereArgs: [filme.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
    return numberRowsAffected;
  }

  Future<int> delete(int id) async {
    final Database db = await _database.getDatabase;
    late final int numberRowsAffected;
    numberRowsAffected = await db.delete(
      Filme.kMOVIETABLE,
      where: '${Filme.kIDMOVIECOLUMN} = ?',
      whereArgs: [id],
    );
    return numberRowsAffected;
  }
}
