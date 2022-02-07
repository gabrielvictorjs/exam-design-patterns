import 'package:design_patterns/patterns/adapter/contact.dart';
import 'package:design_patterns/patterns/factory_method/contacts_adapter_factory.dart';
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
              contactsAdapterFactory: JsonContactsAdapterFactory(),
            ),
            _ContactsContent(
              contactsAdapterFactory: XmlContactsAdapterFactory(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactsContent extends StatefulWidget {
  final ContactsAdapterFactory contactsAdapterFactory;

  const _ContactsContent({
    Key? key,
    required this.contactsAdapterFactory,
  }) : super(key: key);

  @override
  State<_ContactsContent> createState() => _ContactsContentState();
}

class _ContactsContentState extends State<_ContactsContent>
    with AutomaticKeepAliveClientMixin {
  List<Contact>? _contacts;

  @override
  void initState() {
    super.initState();
    final adapter = widget.contactsAdapterFactory.get(context);
    adapter
        .fetchContacts()
        .then((contacts) => setState(() => _contacts = contacts));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

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

  @override
  bool get wantKeepAlive => true;
}
