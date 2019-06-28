#import "RingtoneManagerPlugin.h"
#import <ringtone_manager/ringtone_manager-Swift.h>

@implementation RingtoneManagerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRingtoneManagerPlugin registerWithRegistrar:registrar];
}
@end
