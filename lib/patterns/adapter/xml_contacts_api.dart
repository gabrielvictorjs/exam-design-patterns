import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

class XmlContactsApi {
  final AssetBundle _assetBundle;

  XmlContactsApi(this._assetBundle);

  Future<XmlDocument> fetch() async {
    Future.delayed(const Duration(seconds: 1));
    final data = await _assetBundle.loadString('assets/contacts.xml');
    return XmlDocument.parse(data);
  }
}
