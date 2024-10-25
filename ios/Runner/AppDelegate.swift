import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let shareChannel = FlutterMethodChannel(name: "com.example.stanchproj/share",
                                             binaryMessenger: controller.binaryMessenger)
    
    shareChannel.setMethodCallHandler {
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if call.method == "shareText" {
        if let args = call.arguments as? [String: Any],
           let text = args["text"] as? String {
          self.shareText(text: text)
        }
        result(nil)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func shareText(text: String) {
    let activityVC = UIActivityViewController(activityItems: [text], applicationActivities: nil)
    if let topVC = UIApplication.shared.keyWindow?.rootViewController {
      topVC.present(activityVC, animated: true, completion: nil)
    }
  }
}
