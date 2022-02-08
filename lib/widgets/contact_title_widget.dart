import 'package:design_patterns/patterns/adapter/contact.dart';
import 'package:flutter/material.dart';

class ContactTileWidget extends StatelessWidget {
  final Contact contact;
  final VoidCallback onTap;

  const ContactTileWidget({
    Key? key,
    required this.contact,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
        showDialog(
          context: context,
          builder: (_) => _ContactDetailsDialog(contact: contact),
        );
      },
      title: Text(contact.name),
      subtitle: Text(contact.phone),
    );
  }
}

class _ContactDetailsDialog extends StatelessWidget {
  final Contact contact;

  const _ContactDetailsDialog({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Detalhes do contato'),
      contentPadding: const EdgeInsets.all(
        24,
      ).copyWith(bottom: 12),
      children: [
        Text('Nome: ${contact.name}'),
        Text('Phone: ${contact.phone}'),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ),
      ],
    );
  }
}
