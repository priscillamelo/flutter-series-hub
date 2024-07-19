class Serie {
  static const String kSERIETABLE = 'serie_table';
  static const String kIDSERIECOLUMN = 'idColumnSerie';
  static const String kTITLESERIECOLUMN = 'titleColumnSerie';
  static const String kCURRENTSEASONSERIECOLUMN = 'currentSeasonColumnSerie';
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
  late String titulo;
  late int temporadaAtual = 1;
  String? diretor;
  String? genero;
  String? elenco;
  late int? anoLancamento;
  int? anoFinalizada;
  String? streaming;
  String? sinopse;
  String? poster;
  double avaliacao = 0.0;
  late int temporadas;
  DateTime? dataFinalizada;
  late String categoriaPertencente;

  Serie({
    this.poster,
    this.genero,
    this.anoLancamento,
    this.temporadas = 1,
    required this.titulo,
    required this.categoriaPertencente,
  });

/*   var dataEspecifica = DateTime(2024, 4, 15);
  print("Data específica: $dataEspecifica"); */

  Serie.fromMap(Map map) {
    id = map[kIDSERIECOLUMN];
    titulo = map[kTITLESERIECOLUMN];
    temporadaAtual = map[kCURRENTSEASONSERIECOLUMN];
    diretor = map[kDIRECTORSERIECOLUMN];
    genero = map[kGENRESERIECOLUMN];
    elenco = map[kCASTSERIECOLUMN];
    anoLancamento = map[kRELEASEYEARSERIECOLUMN];
    anoFinalizada = map[kCOMPLETEDYEARSERIECOLUMN];
    streaming = map[kSTREAMINGSERIECOLUMN];
    sinopse = map[kSYNOPSISSERIECOLUMN];
    poster = map[kPOSTERSERIECOLUMN];
    avaliacao = map[kRATINGSERIECOLUMN] ?? 0;
    temporadas = map[kSEASONSSERIECOLUMN] ?? 1;
    dataFinalizada = map[kFINISHDATESERIECOLUMN];
    categoriaPertencente = map[kTABNAMESERIECOLUMN] ?? "";
  }

  Map<String, dynamic> toMap() {
    return {
      kTITLESERIECOLUMN: titulo,
      kCURRENTSEASONSERIECOLUMN: temporadaAtual,
      kDIRECTORSERIECOLUMN: diretor,
      kGENRESERIECOLUMN: genero,
      kCASTSERIECOLUMN: elenco,
      kRELEASEYEARSERIECOLUMN: anoLancamento,
      kCOMPLETEDYEARSERIECOLUMN: anoFinalizada,
      kSTREAMINGSERIECOLUMN: streaming,
      kSYNOPSISSERIECOLUMN: sinopse,
      kPOSTERSERIECOLUMN: poster,
      kRATINGSERIECOLUMN: avaliacao,
      kSEASONSSERIECOLUMN: temporadas,
      kFINISHDATESERIECOLUMN: dataFinalizada,
      kTABNAMESERIECOLUMN: categoriaPertencente,
    };
  }
}
