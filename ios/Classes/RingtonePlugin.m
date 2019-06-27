#import "RingtonePlugin.h"
#import <ringtone_plugin/ringtone_plugin-Swift.h>

@implementation RingtonePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRingtonePlugin registerWithRegistrar:registrar];
}
@end
