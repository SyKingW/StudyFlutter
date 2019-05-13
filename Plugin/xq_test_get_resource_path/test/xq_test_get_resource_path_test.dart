import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xq_test_get_resource_path/xq_test_get_resource_path.dart';

void main() {
  const MethodChannel channel = MethodChannel('xq_test_get_resource_path');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await XqTestGetResourcePath.platformVersion, '42');
  });
}
