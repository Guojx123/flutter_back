package com.example.back

import android.app.Activity
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import java.util.*
import kotlin.concurrent.timerTask

class BasicMessageChannelDemo(var activity: Activity, messenger: BinaryMessenger) : BasicMessageChannel.MessageHandler<Any> {

    var count = 0

    private var channel: BasicMessageChannel<Any>

    init {
        channel = BasicMessageChannel(messenger, "flutter_demo_jiaohu.flutter.io/basic_message_channel", StandardMessageCodec())
        channel.setMessageHandler(this)
        startTimer()
    }
//    Map数据
//    override fun onMessage(message: Any?, reply: BasicMessageChannel.Reply<Any>) {
//        val name = (message as Map<String, Any>)["name"]
//        val age = (message as Map<String, Any>)["age"]
//
//        var map = mapOf("name" to "hello,$name",
//                "age" to "$age"
//        )
//
//        reply.reply(map)
//    }

    override fun onMessage(message: Any?, reply: BasicMessageChannel.Reply<Any>) {
        println("activity-onMessage--flutter传来得数据: ${message.toString()}")
        reply.reply(count++.toString() + " 你回复的：" + message.toString())
    }

    fun startTimer() {
        var timer = Timer().schedule(timerTask {
            activity.runOnUiThread {
                var map = mapOf("count" to count++)
                channel.send(map,object :BasicMessageChannel.Reply<Any>{
                    override fun reply(reply: Any?) {

                    }
                })
            }
        }, 0, 1000)

    }


}