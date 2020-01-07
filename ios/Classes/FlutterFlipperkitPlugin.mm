#import "FlutterFlipperkitPlugin.h"

@implementation FlutterFlipperkitPlugin {
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"flutter_flipperkit"
                                     binaryMessenger:[registrar messenger]];
    FlutterFlipperkitPlugin* instance = [[FlutterFlipperkitPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
    
    FlutterEventChannel* eventChannel =
        [FlutterEventChannel eventChannelWithName:@"flutter_flipperkit/event_channel"
                              binaryMessenger:[registrar messenger]];
    [eventChannel setStreamHandler:instance];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    result(FlutterMethodNotImplemented);
}

- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    return nil;
}


@end
