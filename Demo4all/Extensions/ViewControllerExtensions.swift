import Foundation
import UIKit

public extension UIViewController {
    
    static var topMostViewController: UIViewController? {
        var topMost = UIApplication.shared.keyWindow?.rootViewController
        while let presented = topMost?.presentedViewController {
            topMost = presented
        }
        
        return topMost
    }
    
    var isVisible: Bool {
        return self.isViewLoaded && self.view.window != nil
    }
    
    func showAlert(_ message: String, title: String? = nil, okHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: okHandler))
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithCancel(_ message: String, title: String? = nil, okHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Sim", style: .default, handler: okHandler))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: okHandler))
        present(alert, animated: true, completion: nil)
    }
    
    func popViewControllers(numberOfPops pops: Int, animated: Bool = true) {
        if let navigationController = self as? UINavigationController ?? navigationController {
            var index = navigationController.viewControllers.count - 1 - pops
            if index < 0 {
                index = 0
            }
            let viewController = navigationController.viewControllers[index]
            navigationController.popToViewController(viewController, animated: animated)
        }
    }
    
    func presentViewController(_ viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    func pushViewController(_ viewController: UIViewController) {
        if let navigationController = self as? UINavigationController ?? navigationController {
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
}
