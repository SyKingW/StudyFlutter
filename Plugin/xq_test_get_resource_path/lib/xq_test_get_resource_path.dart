import 'dart:async';

import 'package:flutter/services.dart';

class XqTestGetResourcePath {
  static const MethodChannel _channel =
      const MethodChannel('xq_test_get_resource_path');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
