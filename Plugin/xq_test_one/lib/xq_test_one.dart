import 'dart:async';

import 'package:flutter/services.dart';
import 'package:xq_test_two/xq_test_two.dart';

class XqTestOne {
  static const MethodChannel _channel = const MethodChannel('xq_test_one');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static int add(int a, int b) {
    return a + b;
  }

  static int sub(int a, int b) {
    return XqTestTwo.sub(a, b);
  }
}
