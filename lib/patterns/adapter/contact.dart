class Contact {
  final String name;
  final String phone;

  Contact({
    required this.name,
    required this.phone,
  });

  @override
  String toString() => 'Contact(name: $name, phone: $phone)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Contact && other.name == name && other.phone == phone;
  }

  @override
  int get hashCode => name.hashCode ^ phone.hashCode;
}
