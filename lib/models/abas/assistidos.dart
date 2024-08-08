import '../serie.dart';

class Assistidos {
  static const String aba = "Assistidos";
  late List<Serie> listSeries = [];

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
}
