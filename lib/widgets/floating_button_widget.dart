import 'package:flutter/material.dart';

class FloatingButtonWidget extends StatelessWidget {
  final String routeName;
  final String nameTab;
  final String heroTagName;
  const FloatingButtonWidget(
      {super.key,
      required this.routeName,
      required this.nameTab,
      required this.heroTagName});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: heroTagName,
        onPressed: () {
          Navigator.pushNamed(context, routeName.toString(),
              arguments: nameTab);
        },
        child: const Icon(Icons.add));
  }
}
