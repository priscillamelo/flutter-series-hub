import '../serie.dart';
import '../filme.dart';

class Assistidos {
  static const String aba = "Assistidos";
  late List<Serie> listSeries = [];
  late List<Filme> listMovies = [];

  static final Assistidos _assistirSingleton = Assistidos._internal();

  factory Assistidos() {
    return _assistirSingleton;
  }

  Assistidos._internal();

  List<Serie> get getListSeries {
    return listSeries;
  }

  set setListSeries(List<Serie> listSeries) {
    this.listSeries = listSeries;
  }

  List<Filme> get getListMovies {
    return listMovies;
  }

  set setListMovies(List<Filme> listMovies) {
    this.listMovies = listMovies;
  }
}
