import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/contacts');
            },
            title: const Text('Meus contatos'),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
