import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mop/mop.dart';

void main() {
  const MethodChannel channel = MethodChannel('mop');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Mop.instance.platformVersion, '42');
  });
}
