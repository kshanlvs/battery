
import 'package:flutter/services.dart';

import 'battery_platform_interface.dart';

class Battery {
  Future<String?> getPlatformVersion() {
    return BatteryPlatform.instance.getPlatformVersion();


  }

  static const MethodChannel _channel =
      MethodChannel('com.kishan/battery');

      // Get battery level.
  static Future<String> getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await _channel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%.';
    } on PlatformException {
      batteryLevel = 'Failed to get battery level.';
    }
    return batteryLevel;
  }
}




