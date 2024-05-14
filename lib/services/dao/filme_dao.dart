import 'package:floor/floor.dart';
import 'package:flutter_journal_moviesandseries/models/filme.dart';

@dao
abstract class FilmeDao {
  @Query('SELECT * FROM ${Filme.kMOVIETABLE}')
  Future<List<Filme>> getAllFilmes();

  @insert
  Future<void> insertFilme(Filme filme);

  //@Query('SELECT * FROM ${Filme.filmeTable} WHERE id = :id')
  //Future<Filme?> getFilme();
}
