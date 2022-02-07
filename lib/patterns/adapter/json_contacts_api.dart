import 'dart:convert';

import 'package:flutter/material.dart';

class JsonContactsApi {
  final AssetBundle _assetBundle;

  JsonContactsApi(this._assetBundle);

  Future<Map<String, dynamic>> fetch() async {
    final data = await _assetBundle.loadString('contacts');
    return jsonDecode(data);
  }
}
