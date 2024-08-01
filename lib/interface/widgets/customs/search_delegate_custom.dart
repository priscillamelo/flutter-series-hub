import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/models/serie.dart';
import 'package:flutter_journal_moviesandseries/routes/pages_routes.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Serie> listSerieSearch;

  CustomSearchDelegate(
    this.listSerieSearch,
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Serie> matchQuery = [];
    for (Serie serie in listSerieSearch) {
      if (serie.titulo.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(serie);
      }
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          Serie serieFound = matchQuery[index];
          return ListTile(
            contentPadding: const EdgeInsets.only(top: 8, left: 32, bottom: 8),
            leading: LayoutBuilder(builder: (context, constraints) {
              double heightParent = constraints.maxHeight;
              double widthParent = constraints.maxWidth;
              double widthImage = widthParent * 0.1;
              double heightImage = heightParent * 1.5;
              return serieFound.poster != null
                  ? Image.file(
                      File(serieFound.poster.toString()),
                      semanticLabel: "Poster",
                      fit: BoxFit.fill,
                      width: widthImage,
                      height: heightImage,
                      alignment: Alignment.center,
                    )
                  : Image.asset(
                      "assets/no_image.png",
                      semanticLabel: "Poster",
                      fit: BoxFit.fill,
                      width: widthImage,
                      height: heightImage,
                      alignment: Alignment.center,
                    );
            }),
            title: Text(
              serieFound.titulo,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4, left: 4),
              child: Text(
                serieFound.categoriaPertencente,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, PagesRoutes.kINFO_DATA_PAGE);
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Serie> matchQuery = [];
    for (Serie serie in listSerieSearch) {
      if (serie.titulo.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(serie);
      }
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          Serie serieFound = matchQuery[index];
          return ListTile(
            contentPadding: const EdgeInsets.only(top: 16, left: 32),
            leading: LayoutBuilder(builder: (context, constraints) {
              double heightParent = constraints.maxHeight;
              double widthParent = constraints.maxWidth;
              double widthImage = widthParent * 0.1;
              double heightImage = heightParent * 1.5;
              return serieFound.poster != null
                  ? Image.file(
                      File(serieFound.poster.toString()),
                      semanticLabel: "Poster",
                      fit: BoxFit.fill,
                      width: widthImage,
                      height: heightImage,
                      alignment: Alignment.center,
                    )
                  : Image.asset(
                      "assets/no_image.png",
                      semanticLabel: "Poster",
                      fit: BoxFit.fill,
                      width: widthImage,
                      height: heightImage,
                      alignment: Alignment.center,
                    );
            }),
            title: Text(
              serieFound.titulo,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4, left: 4),
              child: Text(
                serieFound.categoriaPertencente,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, PagesRoutes.kINFO_DATA_PAGE);
            },
          );
        });
  }
}
