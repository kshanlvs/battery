import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'battery_platform_interface.dart';

/// An implementation of [BatteryPlatform] that uses method channels.
class MethodChannelBattery extends BatteryPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('battery');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
