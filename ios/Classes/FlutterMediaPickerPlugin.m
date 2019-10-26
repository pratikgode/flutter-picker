#import "FlutterPickerPlugin.h"
#import <flutter_picker/flutter_picker-Swift.h>

@implementation FlutterMediaPickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterMediaPickerPlugin registerWithRegistrar:registrar];
}
@end
