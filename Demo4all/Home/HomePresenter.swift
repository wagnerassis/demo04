import Foundation
import UIKit

protocol HomeDelegate: class {
    func tapToDetail(placeID: String, viewController: UIViewController)
}

protocol HomeDataSource: class {
    func fetchTasks(list: [String])
}

class HomePresenter {
    let delegate: HomeDelegate
    weak var dataSource: HomeDataSource?
    
    init(delegate: HomeDelegate) {
        self.delegate = delegate
    }
    
    func fetchTasks() {
        PlaceService.fetchTarefas { [weak self] list, errorMessage in
            guard let list = list else { return }
            self?.dataSource?.fetchTasks(list: list)
        }
    }
    
    func goToDetail(placeID: String, viewController: UIViewController) {
        delegate.tapToDetail(placeID: placeID, viewController: viewController)
    }
}
