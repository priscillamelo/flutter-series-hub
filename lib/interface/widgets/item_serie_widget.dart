import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/alert_dialog_widget_custom.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/colors.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/rating_bar_widget.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/rich_text_widget.dart';
import 'package:flutter_journal_moviesandseries/models/serie.dart';

class ItemSerieWidget extends StatefulWidget {
  final Serie serie;
  final String nameTab;

  const ItemSerieWidget(
      {super.key, required this.serie, required this.nameTab});

  @override
  State<ItemSerieWidget> createState() => _ItemSerieWidgetState();
}

class _ItemSerieWidgetState extends State<ItemSerieWidget> {
  @override
  Widget build(BuildContext context) {
    final Serie serie = widget.serie;
    return GestureDetector(
      child: Card(
        color: ColorsTheme.bgCardDetails,
        elevation: 4,
        margin: const EdgeInsets.all(16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.8,
          child: LayoutBuilder(builder: (context, constraints) {
            var heightParent = constraints.maxHeight;
            var widthParent = constraints.maxWidth;
            var widthImage = widthParent * 0.3;
            var heightImage = heightParent * 0.7;
            var sizeIcon = heightParent * 0.12;
            return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: serie.poster != null
                          ? Image.file(
                              File(serie.poster.toString()),
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
                            ),
                    ),
                  ),
                  RatingBarWidget(
                    data: serie,
                    typeData: "serie",
                    sizeIcon: sizeIcon,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichTextWidget(
                      propertie: "Título",
                      propertieValue: serie.titulo,
                    ),
                    RichTextWidget(
                      propertie: "Gênero",
                      propertieValue: serie.genero,
                    ),
                    RichTextWidget(
                      propertie: "Temporadas",
                      propertieValue: serie.temporadas.toString(),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: ColorsTheme.bgInputDetails,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                margin: const EdgeInsets.only(left: 8),
                padding: const EdgeInsets.all(8),
                height: heightParent - 20,
                width: widthParent / 4.5,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sinopse",
                        style: TextStyle(
                          color: ColorsTheme.bgInput,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        serie.sinopse != null ? '${serie.sinopse}' : "",
                        textAlign: TextAlign.start,
                        maxLines: 8,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
              ),
            ]);
          }),
        ),
      ),
      /* TODO: CRIAR UMA PAGINA DE TODAS AS INFORMAÇÕES DA SÉRIE
      onTap: () {
        Navigator.pushNamed(context, PagesRoutes.kUPDATE_MOVIE_SERIE,
            arguments: widget.serie.id.toString());
      }, */
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialogWidgetCustom(
                data: serie,
                typeData: "serie",
              );
            });
      },
    );
  }
}
