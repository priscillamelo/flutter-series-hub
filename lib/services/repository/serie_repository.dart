import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/database/serie_helper.dart';
import 'package:flutter_journal_moviesandseries/models/serie.dart';

class SerieRepository extends ChangeNotifier {
  String get sqlTableMovie => '''
  CREATE TABLE ${Serie.kSERIETABLE}(
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
    ${Serie.kFINISHDATESERIECOLUMN} TEXT,
    ${Serie.kSEASONSSERIECOLUMN} INTEGER,
    ${Serie.kTABNAMESERIECOLUMN} TEXT,
  )
''';

  SerieHelper serieHelper = SerieHelper();
  SerieRepository() {
    _initRepository();
  }

  _initRepository() async {
    await getAllSeries();
  }

  Future<List<Serie>> getAllSeries() async {
    List listMapSeries = await serieHelper.getAllSeries();
    List<Serie> listSeries = [];

    for (Map i in listMapSeries) {
      listSeries.add(Serie.fromMap(i));
    }

    notifyListeners();
    return listSeries;
  }

  Future<void> addSerie(Serie serie) async {
    serieHelper.addSerie(serie);

    notifyListeners();
  }

  Future<void> updateSerie(Serie serie) async {
    await serieHelper.updateSerie(serie);
    notifyListeners();
  }

  Future<dynamic> getSerieById(int id) async {
    Serie? serie = await serieHelper.getSerieById(id);

    return serie;
  }

  Future<int> deleteSerie(int id) async {
    late final int numberRowsAffected;
    numberRowsAffected = await serieHelper.deleteSerie(id);
    notifyListeners();
    return numberRowsAffected;
  }
}
