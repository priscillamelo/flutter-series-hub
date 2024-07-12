import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/alert_dialog_widget_custom.dart';

// MODEL
import '../../models/filme.dart';
// ROUTE
import '../../routes/pages_routes.dart';
// WIDGET
import 'customs/colors.dart';
import 'rating_bar_widget.dart';
import 'rich_text_widget.dart';

class ItemMovieWidget extends StatefulWidget {
  final Filme filme;
  final String nameTab;

  const ItemMovieWidget(
      {super.key, required this.filme, required this.nameTab});

  @override
  State<ItemMovieWidget> createState() => _ItemMovieWidgetState();
}

class _ItemMovieWidgetState extends State<ItemMovieWidget> {
  @override
  Widget build(BuildContext context) {
    final Filme filme = widget.filme;
    return GestureDetector(
      child: Card(
        color: ColorsTheme.bgCardDetails,
        elevation: 4,
        margin: const EdgeInsets.all(16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 6,
          child: LayoutBuilder(builder: (context, constraints) {
            final double availableHeight = constraints.maxHeight;
            final double desiredHeight = availableHeight / 1.5;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        width: constraints.maxWidth / 3,
                        alignment: Alignment.center,
                        child: Image.asset(
                          filme.poster != null
                              ? "${filme.poster}"
                              : "assets/no_image.png",
                          //width: constraints.maxWidth / 4,
                          height: desiredHeight,
                          semanticLabel: "Poster",
                          fit: BoxFit.fill,
                          alignment: Alignment.center,
                        ),
                      ),
                      RatingBarWidget(ratingMovie: filme.avaliacao),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichTextWidget(
                        propertie: "Título",
                        propertieValue: filme.titulo,
                      ),
                      RichTextWidget(
                        propertie: "Gênero",
                        propertieValue: filme.genero,
                      ),
                      RichTextWidget(
                        propertie: "Lançamento",
                        propertieValue: filme.anoLancamento.toString(),
                      ),
                      RichTextWidget(
                        propertie: "Atores Principais",
                        propertieValue: filme.elenco,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    width: constraints.maxWidth / 4.5,
                    height: desiredHeight * 1.3,
                    color: ColorsTheme.bgTabSelected,
                    child: RichTextWidget(
                      propertie: "Sinopse",
                      propertieValue: filme.sinopse,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, PagesRoutes.kUPDATE_MOVIE_SERIE,
            arguments: widget.filme.id.toString());
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialogWidgetCustom(filme: filme);
            });
      },
    );
  }
}
