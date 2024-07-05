import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/interface/widgets/customs/colors.dart';

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
        Navigator.pushNamed(context, routeName.toString(), arguments: nameTab);
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
        Navigator.pushNamed(context, routeName.toString(), arguments: nameTab);
      },
      child: const Icon(
        Icons.add,
        color: ColorsTheme.bgTela,
        size: 48,
      ),
    );
  }
}
