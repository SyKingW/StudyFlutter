import 'dart:async';

import 'package:flutter/services.dart';

class XqTestTwo {
  static const MethodChannel _channel = const MethodChannel('xq_test_two');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static int sub(int a, int b) {
    return a - b;
  }
}
