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
        channel = BasicMessageChannel(messenger, "com.flutter.guide.BasicMessageChannel", StandardMessageCodec())
        channel.setMessageHandler(this)
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
    
}