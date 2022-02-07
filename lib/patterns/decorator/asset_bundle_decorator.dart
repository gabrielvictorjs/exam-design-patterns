import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

abstract class AssetBundleDecorator extends AssetBundle {
  final AssetBundle _assetBundle;

  AssetBundleDecorator(this._assetBundle);

  @override
  Future<ByteData> load(String key) async {
    await Future.delayed(const Duration(seconds: 1));
    return _assetBundle.load(key);
  }

  @override
  Future<T> loadStructuredData<T>(
    String key,
    Future<T> Function(String value) parser,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return _assetBundle.loadStructuredData(key, parser);
  }
}
