import 'package:flutter/material.dart';

// FIREBASE
import 'package:firebase_auth/firebase_auth.dart';
// INTERFACE - UI
import 'package:flutter_journal_moviesandseries/interface/pages/home_page.dart';
import 'package:flutter_journal_moviesandseries/interface/pages/login_page.dart';

class UserRoute extends StatelessWidget {
  const UserRoute({super.key});
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
