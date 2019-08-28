import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }
}

extension AppDelegate {
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigator = MainNavigator()
        navigator.toStart(inWindow: window!)
    }
}
