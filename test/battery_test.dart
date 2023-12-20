import 'package:flutter_test/flutter_test.dart';
import 'package:battery/battery.dart';
import 'package:battery/battery_platform_interface.dart';
import 'package:battery/battery_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBatteryPlatform
    with MockPlatformInterfaceMixin
    implements BatteryPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BatteryPlatform initialPlatform = BatteryPlatform.instance;

  test('$MethodChannelBattery is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBattery>());
  });

  test('getPlatformVersion', () async {
    Battery batteryPlugin = Battery();
    MockBatteryPlatform fakePlatform = MockBatteryPlatform();
    BatteryPlatform.instance = fakePlatform;

    expect(await batteryPlugin.getPlatformVersion(), '42');
  });
}
