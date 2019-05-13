import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xq_test_one/xq_test_one.dart';

void main() {
  const MethodChannel channel = MethodChannel('xq_test_one');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await XqTestOne.platformVersion, '42');
  });
}
