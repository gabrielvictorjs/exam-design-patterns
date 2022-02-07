import 'package:design_patterns/patterns/adapter/contacts_adapter.dart';
import 'package:design_patterns/patterns/adapter/json_contacts_adapter.dart';
import 'package:design_patterns/patterns/adapter/json_contacts_api.dart';
import 'package:design_patterns/patterns/adapter/xml_contacts_adapter.dart';
import 'package:design_patterns/patterns/adapter/xml_contacts_api.dart';
import 'package:design_patterns/patterns/decorator/json_asset_bundle.dart';
import 'package:design_patterns/patterns/decorator/xml_asset_bundle.dart';
import 'package:flutter/cupertino.dart';

abstract class ContactsAdapterFactory {
  ContactsAdapter get(BuildContext context);
}

class JsonContactsAdapterFactory extends ContactsAdapterFactory {
  @override
  ContactsAdapter get(BuildContext context) {
    return JsonContactsAdapter(
      JsonContactsApi(
        JsonAssetBundle(
          DefaultAssetBundle.of(context),
        ),
      ),
    );
  }
}

class XmlContactsAdapterFactory extends ContactsAdapterFactory {
  @override
  ContactsAdapter get(BuildContext context) {
    return XmlContactsAdapter(
      XmlContactsApi(
        XmlAssetBundle(
          DefaultAssetBundle.of(context),
        ),
      ),
    );
  }
}
