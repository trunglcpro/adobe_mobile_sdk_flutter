#import "AdobeMobileSdkFlutterPlugin.h"
#import "ADBMobile.h"

@implementation AdobeMobileSdkFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"adobe_analytics_plugin"
            binaryMessenger:[registrar messenger]];
  AdobeMobileSdkFlutterPlugin* instance = [[AdobeMobileSdkFlutterPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  NSDictionary *arguments = call.arguments;

  if ([@"collectLifecycleData" isEqualToString:call.method]) {
    [self collectLifecycle:call result:result];
  }
  else if ([@"trackAction" isEqualToString:call.method]) {
    [self trackAction:call result:result args:arguments];
  }
  else if ([@"trackState" isEqualToString:call.method]) {
    [self trackState:call result:result args:arguments];
  }
  else if ([@"trackCrash" isEqualToString:call.method]) {
    [self trackCrash:call result:result args:arguments];
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)collectLifecycle:(FlutterMethodCall*)call result:(FlutterResult)result {
  [ADBMobile collectLifecycleData];
  result([NSString stringWithFormat:@"collectLifecycle called"]);
}

- (void)trackAction:(FlutterMethodCall*)call result:(FlutterResult)result args:(NSDictionary*)args {
}

- (void)trackState:(FlutterMethodCall*)call result:(FlutterResult)result args:(NSDictionary*)args {
}

- (void)sendTrack:(NSString*)name additionalData:(NSDictionary*)additionalData isState:(bool)isState {
}

- (void)trackCrash:(FlutterMethodCall*)call result:(FlutterResult)result args:(NSDictionary*)args {

}

@end
