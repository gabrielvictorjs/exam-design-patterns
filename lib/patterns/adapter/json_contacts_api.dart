import 'dart:convert';

import 'package:flutter/material.dart';

class JsonContactsApi {
  final AssetBundle _assetBundle;

  JsonContactsApi(this._assetBundle);

  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(seconds: 1));
    final data = await _assetBundle.loadString('assets/contacts.json');
    return jsonDecode(data);
  }
}
