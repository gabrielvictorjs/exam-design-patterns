import 'package:design_patterns/patterns/adapter/contact.dart';

abstract class ContactsAdapter {
  Future<List<Contact>> fetchContacts();
}
