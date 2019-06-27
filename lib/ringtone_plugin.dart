import 'dart:async';

import 'package:flutter/services.dart';

class RingtoneManager {
  static const MethodChannel _channel =
      const MethodChannel('ringtone_manager');

  static Future<dynamic> get play async {
    return await _channel.invokeMapMethod('play');
  }

  static Future<dynamic> get stop async {
    return await _channel.invokeMapMethod('stop');
  }
}