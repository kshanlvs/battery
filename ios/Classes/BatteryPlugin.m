#import "BatteryPlugin.h"

@implementation BatteryPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"com.kishan/battery"
            binaryMessenger:[registrar messenger]];
  BatteryLevelPlugin* instance = [[BatteryLevelPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getBatteryLevel" isEqualToString:call.method]) {
    result(@(99));
  } else {
    result(FlutterMethodNotImplemented);
  }
}
@end
