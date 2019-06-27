package com.sj.ringtone_plugin

import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class RingtonePlugin(private val registrar: Registrar): MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "ringtone_manager")
      channel.setMethodCallHandler(RingtonePlugin(registrar))
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "play") {
      NotificationManager.play(registrar.context())
      Log.d("RingtoneManager", "play: ")
      result.success(true)
    } else if (call.method == "stop") {
      NotificationManager.stop()
      Log.d("RingtoneManager", "stop: ")
      result.success(true)
    } else {
      result.notImplemented()
    }
  }
}
