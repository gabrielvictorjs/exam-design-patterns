import 'package:design_patterns/patterns/adapter/contact.dart';
import 'package:design_patterns/patterns/observer/observer.dart';

class RecentContactsObserver extends Observer<List<Contact>> {
  final Function(List<Contact>) onChanged;

  RecentContactsObserver(this.onChanged);

  @override
  void update(List<Contact> data) => onChanged(data);
}
