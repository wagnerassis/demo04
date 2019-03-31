import Foundation
import UIKit

class PlaceRouter {
    
    func createModule(placeId: String) -> UIViewController {
        let presenter = PlacePresenter(placeId: placeId, delegate: self)
        let placeViewController = PlaceViewController(presenter: presenter)
        
        return placeViewController
    }
}

extension PlaceRouter: PlaceDelegate {
    func tapToService(viewController: UIViewController) {
       viewController.pushViewController(ServicoViewController())
    }
}
