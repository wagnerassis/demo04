import Foundation
import UIKit

open class BaseNavigationController: UINavigationController {
  
  override open var preferredStatusBarStyle: UIStatusBarStyle {
    return .default
  }
  
  override open func viewDidLoad() {
    super.viewDidLoad()
    
    navigationBar.isTranslucent = false
    navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    navigationBar.tintColor = UIColor.white
    setNeedsStatusBarAppearanceUpdate()
  }
}
