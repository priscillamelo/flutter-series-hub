import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/widgets/assistindo_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(
          child: Text(
            'My Journal: Filmes e Séries',
          ),
        ),
        bottom: const TabBar(
          tabs: [
            Tab(
              text: 'Assistindo',
            ),
            Tab(
              text: 'Assistir',
            ),
            Tab(
              text: 'Concluído',
            )
          ],
        ),
      ),
      body: const TabBarView(children: [
        AssistindoTabWidget(),
        /* AssistirTab()
        ConcluidoTab() */
      ]),
    );
  }
}
