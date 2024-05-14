import 'package:floor/floor.dart';

@entity
class Filme {
  static const String filmeTable = 'filme_table';
  static const String idColumn = 'id';
  static const String tituloColumn = 'titulo';
  static const String diretorColumn = 'diretor';
  static const String generoColumn = 'genero';
  static const String elencoColumn = 'elenco';
  static const String anoLancamentoColumn = 'ano_lancamento';
  static const String streamingColumn = 'streaming';
  static const String sinopseColumn = 'sinopse';
  static const String posterColumn = 'poster';
  static const String avaliacaoColumn = 'avaliacao';
  static const String categoriaPertencenteColumn = 'categoriaPertencente';

  @primaryKey
  int id = 0;

  String titulo = "";
  int anoLancamento = 0;
  String? diretor;
  String? genero;
  String? elenco;
  String? streaming;
  String? sinopse;
  String? poster;
  double? avaliacao;
  String? categoriaPertencente = "";

  Filme(this.titulo, this.anoLancamento, {required this.categoriaPertencente});

  Filme.fromMap(Map map) {
    id = map[idColumn];
    titulo = map[tituloColumn];
    diretor = map[diretorColumn];
    anoLancamento = map[anoLancamentoColumn];
    genero = map[generoColumn];
    avaliacao = map[avaliacaoColumn];
  }

  Map<String, dynamic> toMap() {
    return {
      tituloColumn: titulo,
      diretorColumn: diretor,
      anoLancamentoColumn: anoLancamento,
      generoColumn: genero,
      avaliacaoColumn: avaliacao,
    };
  }
}
