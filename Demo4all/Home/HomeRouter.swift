import Foundation
import UIKit

class HomeRouter {
    
    func createModule() -> UIViewController {
        let presenter = HomePresenter(delegate: self)
        let homeViewController = HomeViewController(presenter: presenter)
        
        return homeViewController
    }
}

extension HomeRouter: HomeDelegate {
    func tapToDetail(placeID: String, viewController: UIViewController) {
        viewController.pushViewController(PlaceRouter().createModule())
    }
}
