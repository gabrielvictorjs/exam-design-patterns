import 'package:design_patterns/patterns/adapter/contact.dart';
import 'package:design_patterns/patterns/adapter/contacts_adapter.dart';
import 'package:design_patterns/patterns/adapter/json_contacts_api.dart';

class JsonContactsAdapter extends ContactsAdapter {
  final JsonContactsApi _api;

  JsonContactsAdapter(this._api);

  @override
  Future<List<Contact>> fetchContacts() async {
    final json = await _api.fetch();

    final contacts = (json['contacts'] as List)
        .map((e) => Contact(
              name: e['name'],
              phone: e['phone'],
            ))
        .toList();

    return contacts;
  }
}
