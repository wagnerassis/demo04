import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        openInitialScene()
        setupKeyboard()
        return true
    }
    
    
    private func openInitialScene() {
        window?.rootViewController = BaseNavigationController(rootViewController: HomeRouter().createModule())
        window?.makeKeyAndVisible()
    }
    
    fileprivate func setupKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 30
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Ok"
        IQKeyboardManager.shared.enableAutoToolbar = false
    }
}
