import 'package:design_patterns/patterns/observer/recent_contacts_observer.dart';
import 'package:design_patterns/patterns/singleton/recent_contacts_singleton.dart';
import 'package:design_patterns/widgets/contact_title_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final recentContactsSingleton = RecentContactsSingleton();
  late RecentContactsObserver recentContactsObserver;

  @override
  void initState() {
    super.initState();
    recentContactsObserver = RecentContactsObserver((_) => setState(() {}));
    recentContactsSingleton.recentContacts.subscribe(recentContactsObserver);
  }

  @override
  void dispose() {
    recentContactsSingleton.recentContacts.unsubscribe(recentContactsObserver);
    super.dispose();
  }

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
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Recentes',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          _buildRecentContacts(),
        ],
      ),
    );
  }

  Widget _buildRecentContacts() {
    final recentContacts = recentContactsSingleton.recentContacts.data;

    if (recentContacts.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(12),
        child: Text('Nenhum contato aberto recentemente'),
      );
    }

    return ListBody(
      children: List.generate(
        recentContacts.length,
        (index) {
          return ContactTileWidget(
            contact: recentContacts[index],
            onTap: () {},
          );
        },
      ),
    );
  }
}
