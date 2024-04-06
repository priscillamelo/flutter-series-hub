import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/pages/criar_conta_page.dart';
import 'package:flutter_journal_moviesandseries/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Projetos Aplicados I',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade100),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      /* home: const DefaultTabController(
        length: 3,
        child: HomePage(),
      ), */
      routes: {
        "/login": (context) => const LoginPage(),
        "/criarConta": (context) => const CriarContaPage(),
        "/home": (context) => const HomePage(),
      },
    );
  }
}

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
        AssistindoTabMain(),
        /* AssistirTab()
        ConcluidoTab() */
      ]),
    );
  }
}

class AssistindoTabMain extends StatefulWidget {
  const AssistindoTabMain({super.key});

  @override
  State<AssistindoTabMain> createState() => _AssistindoTabMainState();
}

class _AssistindoTabMainState extends State<AssistindoTabMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Inicie seus registros!"),
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
        ],
      )),
    );
  }
}
