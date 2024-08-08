import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/models/serie.dart';
import 'package:flutter_journal_moviesandseries/services/repository/serie_repository.dart';
import 'package:provider/provider.dart';

// MODEL
import '../../models/abas/assistindo.dart';
// ROUTES
import '../../routes/pages_routes.dart';
// WIDGET
import 'floating_button_widget.dart';
import 'home_no_data_widget.dart';
import 'item_serie_widget.dart';

class AssistindoTabWidget extends StatefulWidget {
  const AssistindoTabWidget({super.key});

  @override
  State<AssistindoTabWidget> createState() => _AssistindoTabWidgetState();
}

class _AssistindoTabWidgetState extends State<AssistindoTabWidget> {
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
          );
        } else {
          for (int i = 0; i < snapshot.data!.length; i++) {
            if (snapshot.data![i].categoriaPertencente == Assistindo.aba) {
              listSeries.add(snapshot.data![i]);
            }
          }
          if (listSeries.isEmpty) {
            return const HomeNoDataWidget(
              nameTab: Assistindo.aba,
            );
          } else {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(top: 16, right: 8, left: 8),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: listSeries.length,
                          itemBuilder: (context, index) {
                            return ItemSerieWidget(
                              serie: listSeries[index],
                              nameTab: Assistindo.aba,
                            );
                          }),
                    ),
                  ],
                ),
              ),
              floatingActionButton: const FloatingButtonWidgetSmall(
                heroTagName: 'route-add-2',
                routeName: PagesRoutes.kADD_SERIE,
                nameTab: Assistindo.aba,
              ),
            );
          }
        }
      },
    );
  }
}
