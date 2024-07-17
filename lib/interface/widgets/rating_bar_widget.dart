import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/services/repository/filme_repository.dart';
import 'package:flutter_journal_moviesandseries/services/repository/serie_repository.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'customs/colors.dart';

class RatingBarWidget extends StatefulWidget {
  final dynamic data;
  final String typeData;
  const RatingBarWidget(
      {super.key, required this.data, required this.typeData});

  @override
  State<RatingBarWidget> createState() => _RatingBarWidgetState();
}

class _RatingBarWidgetState extends State<RatingBarWidget> {
  @override
  Widget build(BuildContext context) {
    final FilmeRepository filmeRepository =
        Provider.of<FilmeRepository>(context);
    final SerieRepository serieRepository =
        Provider.of<SerieRepository>(context);

    return RatingBar.builder(
      itemSize: 24,
      initialRating: widget.data.avaliacao,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star_rate_rounded,
        color: ColorsTheme.bgTabSelected,
      ),
      onRatingUpdate: (rating) {
        setState(() {
          widget.data.avaliacao = rating;
          widget.typeData == "filme"
              ? filmeRepository.updateMovie(widget.data)
              : serieRepository.updateSerie(widget.data);
        });
      },
    );
  }
}
