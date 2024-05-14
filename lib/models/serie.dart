class Serie {
  static const String kSERIETABLE = 'serie_table';
  static const String kIDSERIECOLUMN = 'idColumnSerie';
  static const String kTITLESERIECOLUMN = 'titleColumnSerie';
  static const String kDIRECTORSERIECOLUMN = 'directorColumnSerie';
  static const String kGENRESERIECOLUMN = 'genreColumnSerie';
  static const String kCASTSERIECOLUMN = 'castColumnSerie';
  static const String kRELEASEYEARSERIECOLUMN = 'releaseYearColumnSerie';
  static const String kCOMPLETEDYEARSERIECOLUMN = 'completedYearColumnSerie';
  static const String kSTREAMINGSERIECOLUMN = 'streamingColumnSerie';
  static const String kSYNOPSISSERIECOLUMN = 'synopsisColumnSerie';
  static const String kPOSTERSERIECOLUMN = 'posterColumnSerie';
  static const String kRATINGSERIECOLUMN = 'ratingColumnSerie';
  static const String kSEASONSSERIECOLUMN = 'seasonsColumnSerie';
  static const String kFINISHDATESERIECOLUMN = 'finishDateColumnSerie';
  static const String kTABNAMESERIECOLUMN = 'tabNameColumnSerie';

  Serie({
    required String titulo,
    required String? diretor,
    required String? genero,
    required List<String>? elenco,
    required int? anoLancada,
    required int? anoFinalizada,
    required List<String>? streaming,
    required String? sinopse,
    required String? poster,
    required double? avaliacao,
    required int? temporadas,
    required DateTime? dataFinalizada,
    required String categoriaPertecente,
  });

/*   var dataEspecifica = DateTime(2024, 4, 15);
  print("Data específica: $dataEspecifica"); */
}
