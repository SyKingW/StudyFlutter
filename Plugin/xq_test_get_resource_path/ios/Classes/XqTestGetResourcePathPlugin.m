#import "XqTestGetResourcePathPlugin.h"

@implementation XqTestGetResourcePathPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"xq_test_get_resource_path"
            binaryMessenger:[registrar messenger]];
  XqTestGetResourcePathPlugin* instance = [[XqTestGetResourcePathPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else if ([call.method isEqualToString:@"getBatteryLevel"]) {
    int batteryLevel = arc4random() % 100;
    result(@(batteryLevel));
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
