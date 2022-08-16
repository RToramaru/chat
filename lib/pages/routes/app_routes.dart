import 'package:flutter/material.dart';

import '../chat_page.dart';
import '../home_page.dart';
import '../login_page.dart';

class AppRoute extends StatelessWidget {
  const AppRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 207, 216, 2020)
      ),
      initialRoute: '/login',
      routes: {
        '/home': (context) => const HomePage(),
        '/chat': (context) => const ChatPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}