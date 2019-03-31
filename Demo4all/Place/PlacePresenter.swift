import Foundation
import UIKit

protocol PlaceDelegate: class {
    func tapToService(viewController: UIViewController)
}

protocol PlaceDataSource: class {
    func placeFetched(place: Place)
}

class PlacePresenter {
    private weak var view: PlaceView?
    private var delegate: PlaceDelegate
    private let placeId: String
    
    init(placeId: String, delegate: PlaceDelegate) {
        self.delegate = delegate
        self.placeId = placeId
    }
    
    func attachView(_ view: PlaceView) {
        self.view = view
    }
    
    func fetchTasks() {
        PlaceService.fetchTarefa (placeId: placeId){ [weak self] (place, errorMessage) in
            guard let place = place else { return }
            self?.view?.setPlaceDetailView(place: place)
            self?.view?.setComments(comments: place.comentarios)
            self?.view?.setHeaderTitle(title: "\(place.cidade) - \(place.bairro)")
        }
    }

    func goToServices(viewController: UIViewController) {
        delegate.tapToService(viewController: viewController)
    }
}
