import Foundation
import UIKit

class PlaceRouter {
    
    func createModule() -> UIViewController {
        let presenter = PlacePresenter(delegate: self)
        let placeViewController = PlaceViewController(presenter: presenter)
        
        return placeViewController
    }
}

extension PlaceRouter: PlaceDelegate {

}
