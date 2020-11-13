package com.example.back

import android.app.Activity
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.*
import kotlin.concurrent.timerTask

class MethodChannelDemo(var activity: Activity, messenger: BinaryMessenger) : MethodChannel.MethodCallHandler {

    private var channel: MethodChannel
    private var count = 0
    var map = {}

    init {
        channel = MethodChannel(messenger, "com.flutter.guide.MethodChannel")
        channel.setMethodCallHandler(this)
        startTimer()
    }


    fun startTimer() {
        var timer = Timer().schedule(timerTask {
            activity.runOnUiThread {
                map = mapOf("count" to count++)
            }
        }, 0, 1000)

    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        channel.invokeMethod("timer", map)
        System.out.println("响应")
    }

}
