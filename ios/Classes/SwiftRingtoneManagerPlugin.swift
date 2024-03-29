import Flutter
import UIKit

public class SwiftRingtoneManagerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ringtone_manager", binaryMessenger: registrar.messenger())
    let instance = SwiftRingtoneManagerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "play" {
            SetRingerProfile.activateRingerProfiles()
            result(true)
        } else if call.method == "stop" {
            SetRingerProfile.deactivateRingerProfiles()
            result(true)
        }
  }
}
