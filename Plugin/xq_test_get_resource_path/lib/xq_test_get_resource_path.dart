import 'dart:async';

import 'package:flutter/services.dart';

class XqTestGetResourcePath {
  static const MethodChannel _channel =
      const MethodChannel('xq_test_get_resource_path');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await _channel
          .invokeMethod('getBatteryLevel', {'paramName': 'paramVale'});
      batteryLevel = 'Battery level: $result%.';
    } catch (e) {
      batteryLevel = 'Failed to get battery level.';
    }
    return batteryLevel;
  }
}
