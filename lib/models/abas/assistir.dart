import '../serie.dart';
import '../filme.dart';

class Assistir {
  static const String aba = "Assistir";
  late List<Serie> listSeries = [];
  late List<Filme> listMovies = [];

  static final Assistir _assistirSingleton = Assistir._internal();

  factory Assistir() {
    return _assistirSingleton;
  }

  Assistir._internal();

  List<Filme> get getListMovies {
    return listMovies;
  }

  set setListMovies(List<Filme> listMovies) {
    this.listMovies = listMovies;
  }
}
