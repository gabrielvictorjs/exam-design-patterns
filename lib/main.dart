import 'package:design_patterns/pages/contacts_page.dart';
import 'package:design_patterns/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design Patterns',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routes: {
        '/': (_) => const HomePage(),
        '/contacts': (_) => const ContactsPage(),
      },
    );
  }
}
