import Foundation
import UIKit

protocol PlaceDelegate: class {
    
}

protocol PlaceDataSource: class {
    func placeFetched(place: Place)
}

class PlacePresenter {
    var delegate: PlaceDelegate
    weak var dataSource: PlaceDataSource?
    
    init(delegate: PlaceDelegate) {
        self.delegate = delegate
    }
    
    func fetchTasks(placeId: String) {
        PlaceService.fetchTarefa (placeId: placeId){ [weak self] (place, errorMessage) in
            guard let place = place else { return }
            self?.dataSource?.placeFetched(place: place)
        }
    }

}
