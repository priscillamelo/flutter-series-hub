import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/widgets/assistindo_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

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
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
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
      body: TabBarView(controller: _tabController, children: const [
        AssistindoTabWidget(),
        /* AssistirTab()
        ConcluidoTab() */
      ]),
    );
  }
}
