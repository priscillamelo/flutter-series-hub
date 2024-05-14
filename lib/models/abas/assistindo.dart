import '../serie.dart';

class Assistindo {
  static const String aba = "Assistindo";
  late List<Serie> listSeries = [];

  static final Assistindo _assistirSingleton = Assistindo._internal();

  factory Assistindo() {
    return _assistirSingleton;
  }

  Assistindo._internal();

  List<Serie> get getListSeries {
    return listSeries;
  }

  set setListSeries(List<Serie> listSeries) {
    this.listSeries = listSeries;
  }
}
