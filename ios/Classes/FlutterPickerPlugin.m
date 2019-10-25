#import "FlutterPickerPlugin.h"
#import <flutter_picker/flutter_picker-Swift.h>

@implementation FlutterPickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterPickerPlugin registerWithRegistrar:registrar];
}
@end
