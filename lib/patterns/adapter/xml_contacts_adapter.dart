import 'package:design_patterns/patterns/adapter/contact.dart';
import 'package:design_patterns/patterns/adapter/contacts_adapter.dart';
import 'package:design_patterns/patterns/adapter/xml_contacts_api.dart';
import 'package:xml/xml.dart';

class XmlContactsAdapter extends ContactsAdapter {
  final XmlContactsApi _api;

  XmlContactsAdapter(this._api);

  @override
  Future<List<Contact>> fetchContacts() async {
    final document = await _api.fetch();
    return document
        .findAllElements('contact')
        .map((e) => Contact(
              name: e.findElements('name').single.text,
              phone: e.findElements('phone').single.text,
            ))
        .toList();
  }
}
