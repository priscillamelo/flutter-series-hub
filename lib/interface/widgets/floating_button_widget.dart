import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/colors.dart';
import 'package:flutter_journal_moviesandseries/routes/pages_routes.dart';

class FloatingButtonWidgetLarge extends StatelessWidget {
  final String routeName;
  final String nameTab;
  final String heroTagName;
  const FloatingButtonWidgetLarge(
      {super.key,
      required this.routeName,
      required this.nameTab,
      required this.heroTagName});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      backgroundColor: ColorsTheme.fontText,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      heroTag: heroTagName,
      onPressed: () {
        Navigator.pushNamed(context, PagesRoutes.kADD_SERIE,
            arguments: {'nameTab': nameTab, 'typeData': 'Série'});
        /* if (nameTab == Assistindo.aba) {
          Navigator.pushNamed(context, PagesRoutes.kADD_MOVIE_SERIE,
              arguments: {'nameTab': nameTab, 'typeData': 'Série'});
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialogWidget(
                nameTab: nameTab,
              );
            },
          );
        } */
      },
      child: const Icon(
        Icons.add,
        color: ColorsTheme.bgTela,
        size: 80,
      ),
    );
  }
}

class FloatingButtonWidgetSmall extends StatelessWidget {
  final String routeName;
  final String nameTab;
  final String heroTagName;
  const FloatingButtonWidgetSmall(
      {super.key,
      required this.routeName,
      required this.nameTab,
      required this.heroTagName});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorsTheme.fontText,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      heroTag: heroTagName,
      onPressed: () {
        Navigator.pushNamed(context, PagesRoutes.kADD_SERIE,
            arguments: {'nameTab': nameTab, 'typeData': 'Série'});
        /* if (nameTab == Assistindo.aba) {
          Navigator.pushNamed(context, PagesRoutes.kADD_MOVIE_SERIE,
              arguments: {'nameTab': nameTab, 'typeData': 'Série'});
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialogWidget(
                nameTab: nameTab,
              );
            },
          );
        } */
      },
      child: const Icon(
        Icons.add,
        color: ColorsTheme.bgTela,
        size: 48,
      ),
    );
  }
}
