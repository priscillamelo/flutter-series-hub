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

  int id = 0;
  String titulo = "";
  late int anoLancamento;
  int? anoFinalizada;
  int temporadas = 1;
  String? diretor;
  String? genero;
  String? elenco;
  String? streaming;
  String? sinopse;
  String? poster;
  double avaliacao = 0;
  DateTime? dataFinalizada;
  late String categoriaPertencente;

  Serie(this.titulo, this.anoLancamento, {required this.categoriaPertencente});

/*   var dataEspecifica = DateTime(2024, 4, 15);
  print("Data específica: $dataEspecifica"); */

  Serie.fromMap(Map map) {
    id = map[kIDSERIECOLUMN];
    titulo = map[kTITLESERIECOLUMN];
    diretor = map[kDIRECTORSERIECOLUMN];
    anoLancamento = map[kRELEASEYEARSERIECOLUMN];
    genero = map[kGENRESERIECOLUMN];
    avaliacao = map[kRATINGSERIECOLUMN] ?? 0;
    categoriaPertencente = map[kTABNAMESERIECOLUMN] ?? "";
  }

  Map<String, dynamic> toMap() {
    return {
      kTITLESERIECOLUMN: titulo,
      kDIRECTORSERIECOLUMN: diretor,
      kRELEASEYEARSERIECOLUMN: anoLancamento,
      kGENRESERIECOLUMN: genero,
      kRATINGSERIECOLUMN: avaliacao,
      kTABNAMESERIECOLUMN: categoriaPertencente,
    };
  }
}
