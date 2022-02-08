import 'dart:collection';

import 'package:design_patterns/patterns/adapter/contact.dart';
import 'package:design_patterns/patterns/observer/observer.dart';

class RecentContactsSingleton {
  static final _instance = RecentContactsSingleton._();

  RecentContactsSingleton._();

  factory RecentContactsSingleton() {
    return _instance;
  }

  final recentContacts = Observable<List<Contact>>([]);

  void addRecentContact(Contact contact) {
    final recentContactsCopy = Queue.of(recentContacts.data);
    if (recentContactsCopy.length == 5) {
      recentContactsCopy.removeLast();
    }
    if (recentContactsCopy.contains(contact)) {
      recentContactsCopy.remove(contact);
    }
    recentContactsCopy.addFirst(contact);
    recentContacts.notify(recentContactsCopy.toList());
  }
}
