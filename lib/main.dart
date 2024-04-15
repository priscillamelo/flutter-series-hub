import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/pages/criar_conta_page.dart';
import 'package:flutter_journal_moviesandseries/pages/home_page.dart';
import 'package:flutter_journal_moviesandseries/pages/login_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_journal_moviesandseries/widgets/colors.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          scaffoldBackgroundColor: ColorsTheme.bgTela,
          primaryColor: Colors.amber.shade400,
          /* buttonTheme: const ButtonThemeData(
            buttonColor: ColorsTheme.bgInputDetails,
            textTheme: ButtonTextTheme.normal,
          ), */
          colorScheme: ColorScheme.fromSeed(seedColor: ColorsTheme.bgTela),
          useMaterial3: true,
        ),
        routes: {
          "/login": (context) => const LoginPage(),
          "/criarConta": (context) => const CriarContaPage(),
          "/home": (context) => const HomePage(),
        },
        home: const DefaultTabController(
          length: 3,
          child: Routes(),
        ));
  }
}

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        });
  }
}
