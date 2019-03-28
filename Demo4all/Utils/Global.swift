import Foundation
import UIKit

public func screenBased<T: Any>(regular: T, reduced: T? = nil, extended: T? = nil) -> T {
    
    if let reduced = reduced, UIScreen.isReduced {
        return reduced
    } else if let extended = extended, UIScreen.isIPhoneX {
        return extended
    }
    
    return regular
}

public protocol AppVersion {
    var appVersion: String { get }
}
