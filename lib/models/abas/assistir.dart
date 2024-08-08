import 'package:flutter_journal_moviesandseries/models/serie.dart';

class Assistir {
  static const String aba = "Assistir";
  late List<Serie> listDatas = [];

  static final Assistir _assistirSingleton = Assistir._internal();

  factory Assistir() {
    return _assistirSingleton;
  }

  Assistir._internal();
}
