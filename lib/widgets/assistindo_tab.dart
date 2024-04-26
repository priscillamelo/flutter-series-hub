import 'package:flutter/material.dart';

class AssistindoTabWidget extends StatefulWidget {
  const AssistindoTabWidget({super.key});

  @override
  State<AssistindoTabWidget> createState() => _AssistindoTabMainState();
}

class _AssistindoTabMainState extends State<AssistindoTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/addMovieOrSerie",
                );
              },
              child: const Icon(Icons.add)),
          const Text("Inicie seus registros!"),
        ],
      )),
    );
  }
}
