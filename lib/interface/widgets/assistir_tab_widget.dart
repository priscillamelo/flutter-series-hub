import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/item_serie_widget.dart';
import 'package:flutter_journal_moviesandseries/models/serie.dart';
import 'package:flutter_journal_moviesandseries/services/repository/serie_repository.dart';
// PROVIDER
import 'package:provider/provider.dart';

// MODEL
import '../../models/abas/assistir.dart';
// ROUTES
import '../../routes/pages_routes.dart';
import 'floating_button_widget.dart';
import 'home_no_data_widget.dart';

class AssistirTabWidget extends StatefulWidget {
  const AssistirTabWidget({super.key});

  @override
  State<AssistirTabWidget> createState() => _AssistirTabWidgetMainState();
}

class _AssistirTabWidgetMainState extends State<AssistirTabWidget> {
  final TextEditingController controllerSearch = TextEditingController();

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
              if (snapshot.data![i].categoriaPertencente == Assistir.aba) {
                listSeries.add(snapshot.data![i]);
              }
            }

            if (listSeries.isEmpty) {
              return const HomeNoDataWidget(
                nameTab: Assistir.aba,
              );
            } else {
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 8, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: listSeries.length,
                            itemBuilder: (context, index) {
                              return ItemSerieWidget(
                                serie: listSeries[index],
                                nameTab: Assistir.aba,
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                floatingActionButton: const Padding(
                  padding: EdgeInsets.only(right: 8, bottom: 8),
                  child: FloatingButtonWidgetSmall(
                    heroTagName: 'route-add-2',
                    routeName: PagesRoutes.kADD_SERIE,
                    nameTab: Assistir.aba,
                  ),
                ),
              );
            }
          }
        });
  }
}
