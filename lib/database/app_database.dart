import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import '../models/filme.dart';
import '../services/dao/filme_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Filme])
abstract class AppDatabase extends FloorDatabase {
  FilmeDao get filmeDao;
}

/* CREATE TABLE ${Filme.filmeTable}(
    ${Filme.idColumn} INTEGER PRIMARY KEY idColumn,
    ${Filme.tituloColumn} TEXT,
    ${Filme.diretorColumn} TEXT,
    ${Filme.generoColumn} TEXT,
    ${Filme.elencoColumn} TEXT,
    ${Filme.anoLancamentoColumn} INTEGER,
    ${Filme.streamingColumn} TEXT,
    ${Filme.sinopseColumn} TEXT,
    ${Filme.posterColumn} TEXT,
    ${Filme.avaliacaoColumn} REAL,
    ${Filme.categoriaPertencenteColumn} TEXT,
  )
  ''';
  String get serie => '''
  CREATE TABLE serie(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT,
    diretor TEXT,
    genero TEXT,
    elenco TEXT,
    anoLancamento INTEGER,
    anoFinalizada INTEGER,
    streaming TEXT,
    sinopse TEXT,
    poster TEXT,
    avaliacao REAL,
    temporadas INTEGER,
    dataFinalizada TEXT,
    categoriaPertencente TEXT,
  )
  ''';
  String get usuario => '''
  CREATE TABLE usuario(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    sobrenome TEXT,
    nomeUsuario TEXT,
    email TEXT,
    senha TEXT,
    imgPerfil TEXT,
  )
  '''; */
