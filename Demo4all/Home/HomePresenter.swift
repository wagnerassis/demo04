import Foundation
import UIKit

protocol HomeDelegate {
    func tapToDetail(placeID: String, viewController: UIViewController)
}

class HomePresenter {
    var delegate: HomeDelegate
    
    init(delegate: HomeDelegate) {
        self.delegate = delegate
    }
    
    func goToDetail(placeID: String, viewController: UIViewController) {
        delegate.tapToDetail(placeID: placeID, viewController: viewController)
    }
}
