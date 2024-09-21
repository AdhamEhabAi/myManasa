package com.skyonlineplus.app

import android.os.Bundle
import android.view.WindowManager.LayoutParams
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Prevent screenshots and video recording
        window.setFlags(
            LayoutParams.FLAG_SECURE,
            LayoutParams.FLAG_SECURE
        )
    }
}
