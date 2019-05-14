import 'dart:async';

import 'package:flutter/services.dart';
import 'xq_customDialog.dart';

class XqDialogPlugin {
  static const MethodChannel _channel =
      const MethodChannel('xq_dialog_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
