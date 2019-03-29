import Foundation
import TableManager
import UIKit
import SnapKit

class PlaceViewController: BaseViewController {
    var imageHeader = UIImageView()
    var imageStar = UIImageView()
    var titleLabel = UILabel()
    
    var phoneButton = UIButton()
    var serviceButton = UIButton()
    var addressButton = UIButton()
    var commentButton = UIButton()
    var favoriteButton = UIButton()
    
    var descLabel = UILabel()
    
    var tableView = UITableView()
    var presenter: PlacePresenter
    
    //MARK: Init
    init(presenter: PlacePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
