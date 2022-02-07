import 'dart:typed_data';

import 'package:design_patterns/patterns/decorator/asset_bundle_decorator.dart';
import 'package:flutter/material.dart';

class JsonAssetBundle extends AssetBundleDecorator {
  JsonAssetBundle(AssetBundle assetBundle) : super(assetBundle);

  @override
  Future<ByteData> load(String key) {
    return super.load('assets/$key.json');
  }

  @override
  Future<T> loadStructuredData<T>(
    String key,
    Future<T> Function(String value) parser,
  ) {
    return super.loadStructuredData('assets/$key.json', parser);
  }
}
