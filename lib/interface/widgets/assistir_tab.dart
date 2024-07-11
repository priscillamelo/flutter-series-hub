import 'package:flutter/material.dart';

// PROVIDER
import 'package:provider/provider.dart';
// SERVICE
import '../../services/repository/filme_repository.dart';
// MODEL
import '../../models/abas/assistir.dart';
// ROUTES
import '../../routes/pages_routes.dart';
// WIDGET
import 'customs/colors.dart';
import 'floating_button_widget.dart';
import 'home_no_data_widget.dart';

import 'item_movie_widget.dart';

class AssistirTab extends StatefulWidget {
  const AssistirTab({super.key});

  @override
  State<AssistirTab> createState() => _AssistirTabState();
}

class _AssistirTabState extends State<AssistirTab> {
  @override
  Widget build(BuildContext context) {
    final filmeRepository = Provider.of<FilmeRepository>(context);
    return FutureBuilder(
      future: filmeRepository.getAllMovies(),
      builder: (context, snapshot) {
        //print(snapshot.data!.isEmpty.toString());
        if (snapshot.data?.isEmpty ?? true) {
          return const HomeNoDataWidget(
            nameTab: Assistir.aba,
          );
        } else {
          return Scaffold(
            body: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                  //width: MediaQuery.of(context).size.width / 2,
                  child: SearchBar(
                    leading: const Icon(Icons.search),
                    hintText: "Pesquisar filme ou série",
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
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ItemMovieWidget(
                        filme: snapshot.data![index],
                        nameTab: Assistir.aba,
                      );
                    }),
              ],
            ),
            floatingActionButton: const FloatingButtonWidgetSmall(
              heroTagName: 'route-add-2',
              routeName: PagesRoutes.kADD_MOVIE_SERIE,
              nameTab: Assistir.aba,
            ),
          );
        }
      },
    );
  }
}

/* SearchBar(
                  leading: const Icon(Icons.search),
                  hintText: "Pesquisar filme ou série",
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
                ), */

/* List<Filme> listFilmes = [];

      for (Map i in listMap) {
        listFilmes.add(Filme.fromMap(i));
      } */