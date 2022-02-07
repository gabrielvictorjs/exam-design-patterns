import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

class XmlContactsApi {
  final AssetBundle _assetBundle;

  XmlContactsApi(this._assetBundle);

  Future<XmlDocument> fetch() async {
    final data = await _assetBundle.loadString('contacts');
    return XmlDocument.parse(data);
  }
}
