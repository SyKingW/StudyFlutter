import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xq_test_two/xq_test_two.dart';

void main() {
  const MethodChannel channel = MethodChannel('xq_test_two');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await XqTestTwo.platformVersion, '42');
  });
}
