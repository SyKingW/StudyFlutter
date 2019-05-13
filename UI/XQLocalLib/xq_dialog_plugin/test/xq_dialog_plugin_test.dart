import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xq_dialog_plugin/xq_dialog_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('xq_dialog_plugin');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await XqDialogPlugin.platformVersion, '42');
  });
}
