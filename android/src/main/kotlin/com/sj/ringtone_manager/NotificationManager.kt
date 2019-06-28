package com.sj.ringtone_manager

import android.content.Context
import android.media.AudioManager
import android.media.Ringtone
import android.media.RingtoneManager
import android.os.Vibrator


class NotificationManager {

  companion object {
    private var ringtone: Ringtone? = null
    private var vibrator: Vibrator? = null

    open fun play(context: Context) {
      stop()

      val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
      when (audioManager.ringerMode) {
        AudioManager.RINGER_MODE_VIBRATE -> vibrate(context)
        AudioManager.RINGER_MODE_SILENT -> {
        }
        else -> playRingtone(context)
      }
    }

    private fun playRingtone(context: Context) {
      val uri = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_RINGTONE)
      ringtone = RingtoneManager.getRingtone(context, uri)
      ringtone!!.play()
    }

    private fun vibrate(context: Context) {
      vibrator = context.getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
      if (vibrator != null && vibrator!!.hasVibrator()) {
        // Start without a delay
        // Vibrate for 100 milliseconds
        // Sleep for 1000 milliseconds
        val pattern = longArrayOf(0, 2000, 1000)
        vibrator!!.vibrate(pattern, 0)
      }
    }

    open fun stop() {
      if (ringtone != null) {
        ringtone!!.stop()
        ringtone = null
      }

      if (vibrator != null) {
        vibrator!!.cancel()
        vibrator = null
      }
    }
  }
}
