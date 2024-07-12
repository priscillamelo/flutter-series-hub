import 'package:flutter_journal_moviesandseries/models/serie.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';

class SerieHelper {
  final DB _database = DB.instanceDatabase;

  void addSerie(Serie serie) async {
    final Database db = await _database.getDatabase;

    db.insert(Serie.kSERIETABLE, serie.toMap());
  }

  Future<List> getAllSeries() async {
    final Database db = await _database.getDatabase;
    final List listAllMovies = await db.query(Serie.kSERIETABLE);
    return listAllMovies;
  }

  Future<Serie?> getSerieById(int idSerie) async {
    final Database db = await _database.getDatabase;
    final List<Map> serieMaps = await db.query(Serie.kSERIETABLE,
        where: '${Serie.kIDSERIECOLUMN} = ?', whereArgs: [idSerie]);

    return serieMaps.isNotEmpty ? Serie.fromMap(serieMaps.first) : null;
  }

  Future<int> updateSerie(Serie serie) async {
    final Database db = await _database.getDatabase;
    late final int numberRowsAffected;

    numberRowsAffected = await db.update(Serie.kSERIETABLE, serie.toMap(),
        where: '${Serie.kIDSERIECOLUMN} = ?',
        whereArgs: [serie.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
    return numberRowsAffected;
  }

  Future<int> deleteSerie(int idSerie) async {
    final Database db = await _database.getDatabase;
    late final int numberRowsAffected;
    numberRowsAffected = await db.delete(
      Serie.kSERIETABLE,
      where: '${Serie.kIDSERIECOLUMN} = ?',
      whereArgs: [idSerie],
    );
    return numberRowsAffected;
  }
}
