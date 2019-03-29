import Foundation
import UIKit

protocol PlaceDelegate {
    
}

class PlacePresenter {
    var delegate: PlaceDelegate
    
    init(delegate: PlaceDelegate) {
        self.delegate = delegate
    }
    
    func fetchTasks(placeId: String) {
        PlaceService.fetchTarefa (placeId: placeId){ (place, errorMessage) in
            print(place)
        }
    }

}
