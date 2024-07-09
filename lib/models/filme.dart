class Filme {
  static const String kMOVIETABLE = 'movie_table';
  static const String kIDMOVIECOLUMN = 'idColumnMovie';
  static const String kTITLEMOVIECOLUMN = 'titleColumnMovie';
  static const String kDIRECTORMOVIECOLUMN = 'directorColumnMovie';
  static const String kGENREMOVIECOLUMN = 'genreColumnMovie';
  static const String kCASTMOVIECOLUMN = 'castColumnMovie';
  static const String kRELEASEYEARMOVIECOLUMN = 'releaseYearColumnMovie';
  static const String kSTREAMINGMOVIECOLUMN = 'streamingColumnMovie';
  static const String kSYNOPSISMOVIECOLUMN = 'synopsisColumnMovie';
  static const String kPOSTERMOVIECOLUMN = 'posterColumnMovie';
  static const String kRATINGMOVIECOLUMN = 'ratingColumnMovie';
  static const String kTABNAMEMOVIECOLUMN = 'tabNameColumnMovie';

  int id = 0;
  String titulo = "";
  late int anoLancamento;
  String? diretor;
  String? genero;
  String? elenco;
  String? streaming;
  String? sinopse;
  String? poster;
  double avaliacao = 0;
  String? categoriaPertencente = "";

  Filme(this.titulo, this.anoLancamento, {required this.categoriaPertencente});

  Filme.fromMap(Map map) {
    id = map[kIDMOVIECOLUMN];
    titulo = map[kTITLEMOVIECOLUMN];
    diretor = map[kDIRECTORMOVIECOLUMN];
    anoLancamento = map[kRELEASEYEARMOVIECOLUMN];
    genero = map[kGENREMOVIECOLUMN];
    avaliacao = map[kRATINGMOVIECOLUMN];
  }

  Map<String, dynamic> toMap() {
    return {
      kTITLEMOVIECOLUMN: titulo,
      kDIRECTORMOVIECOLUMN: diretor,
      kRELEASEYEARMOVIECOLUMN: anoLancamento,
      kGENREMOVIECOLUMN: genero,
      kRATINGMOVIECOLUMN: avaliacao,
    };
  }
}
