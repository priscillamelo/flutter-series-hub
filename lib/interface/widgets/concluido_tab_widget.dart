import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/colors.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/item_serie_widget.dart';
import 'package:flutter_journal_moviesandseries/models/serie.dart';
import 'package:flutter_journal_moviesandseries/services/repository/serie_repository.dart';
import 'package:provider/provider.dart';

import '../../models/abas/assistidos.dart';
// ROUTES
import '../../routes/pages_routes.dart';
// WIDGET
import 'floating_button_widget.dart';
import 'home_no_data_widget.dart';

class ConcluidoTabWidget extends StatefulWidget {
  const ConcluidoTabWidget({super.key});

  @override
  State<ConcluidoTabWidget> createState() => _ConcluidoTabWidgetState();
}

class _ConcluidoTabWidgetState extends State<ConcluidoTabWidget> {
  @override
  Widget build(BuildContext context) {
    final serieRepository = Provider.of<SerieRepository>(context);
    final List<Serie> listSeries = [];

    return FutureBuilder(
        future: serieRepository.getAllSeries(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            ); /* const HomeNoDataWidget(
              nameTab: Assistidos.aba,
            ); */
          } else {
            for (int i = 0; i < snapshot.data!.length; i++) {
              if (snapshot.data![i].categoriaPertencente == Assistidos.aba) {
                listSeries.add(snapshot.data![i]);
              }
            }
            if (listSeries.isEmpty) {
              return const HomeNoDataWidget(
                nameTab: Assistidos.aba,
              );
            } else {
              return Scaffold(
                body: Column(children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 64, vertical: 16),
                    child: SearchBar(
                      leading: const Icon(Icons.search),
                      hintText: "Pesquisar série",
                      trailing: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: const Text("Buscar"),
                        ),
                      ],
                      backgroundColor: WidgetStateProperty.all(
                        Color(ColorsTheme.bgInput.value),
                      ),
                      shape: WidgetStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.all(8),
                      ),
                      textInputAction: TextInputAction.search,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: listSeries.length,
                        itemBuilder: (context, index) {
                          return ItemSerieWidget(
                            serie: listSeries[index],
                            nameTab: Assistidos.aba,
                          );
                        }),
                  ),
                ]),
                floatingActionButton: const FloatingButtonWidgetSmall(
                  heroTagName: 'route-add-2',
                  routeName: PagesRoutes.kADD_MOVIE_SERIE,
                  nameTab: Assistidos.aba,
                ),
              );
            }
          }
        });
  }
}
