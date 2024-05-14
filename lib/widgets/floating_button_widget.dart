import 'package:flutter/material.dart';

class FloatingButtonWidget extends StatelessWidget {
  final String routeName;
  final String nameTab;
  const FloatingButtonWidget(
      {super.key, required this.routeName, required this.nameTab});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, routeName.toString(),
              arguments: nameTab);
        },
        child: const Icon(Icons.add));
  }
}
