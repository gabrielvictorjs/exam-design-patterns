import 'package:design_patterns/patterns/adapter/contact.dart';
import 'package:design_patterns/patterns/adapter/contacts_adapter.dart';
import 'package:design_patterns/patterns/adapter/json_contacts_adapter.dart';
import 'package:design_patterns/patterns/adapter/json_contacts_api.dart';
import 'package:design_patterns/patterns/adapter/xml_contacts_adapter.dart';
import 'package:design_patterns/patterns/adapter/xml_contacts_api.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meus contatos'),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            tabs: [
              Tab(child: Text('Json')),
              Tab(child: Text('Xml')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _ContactsContent(
              contactsAdapter: JsonContactsAdapter(
                JsonContactsApi(
                  DefaultAssetBundle.of(context),
                ),
              ),
            ),
            _ContactsContent(
              contactsAdapter: XmlContactsAdapter(
                XmlContactsApi(
                  DefaultAssetBundle.of(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactsContent extends StatefulWidget {
  final ContactsAdapter contactsAdapter;

  const _ContactsContent({
    Key? key,
    required this.contactsAdapter,
  }) : super(key: key);

  @override
  State<_ContactsContent> createState() => _ContactsContentState();
}

class _ContactsContentState extends State<_ContactsContent> {
  List<Contact>? _contacts;

  @override
  void initState() {
    super.initState();
    widget.contactsAdapter
        .fetchContacts()
        .then((contacts) => setState(() => _contacts = contacts));
  }

  @override
  Widget build(BuildContext context) {
    if (_contacts == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: _contacts!.length,
      itemBuilder: (_, index) {
        final contact = _contacts![index];
        return ListTile(
          title: Text(contact.name),
          subtitle: Text(contact.phone),
        );
      },
    );
  }
}
