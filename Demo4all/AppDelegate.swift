import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        openInitialScene()
        return true
    }
    
    
    private func openInitialScene() {
        window?.rootViewController = BaseNavigationController(rootViewController: HomeRouter().createModule())
        window?.makeKeyAndVisible()
    }
}
