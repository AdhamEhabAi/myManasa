import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        // Prevent screenshots and video recording
        self.window?.layer.contentsRect = CGRect(x: -1, y: -1, width: 0, height: 0)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
