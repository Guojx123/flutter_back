package com.example.back

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        BasicMessageChannelDemo(this,flutterEngine.dartExecutor.binaryMessenger)
        MethodChannelDemo(this,flutterEngine.dartExecutor.binaryMessenger)
        EventChannelDemo(this,flutterEngine.dartExecutor.binaryMessenger)
    }
}
