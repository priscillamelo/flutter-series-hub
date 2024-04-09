import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/pages/criar_conta_page.dart';
import 'package:flutter_journal_moviesandseries/pages/home_page.dart';
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
        routes: {
          "/login": (context) => const LoginPage(),
          "/criarConta": (context) => const CriarContaPage(),
          "/home": (context) => const HomePage(),
        },
        home: const DefaultTabController(
          length: 3,
          child: LoginPage(),
        ));
  }
}
