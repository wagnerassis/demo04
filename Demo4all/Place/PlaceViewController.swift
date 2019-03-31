import Foundation
import TableManager
import UIKit
import SnapKit

class PlaceViewController: BaseViewController {
    var tableView = UITableView()
    let sectionComments = Section()
    var presenter: PlacePresenter
    
    //MARK: Init
    init(presenter: PlacePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightUltraGray
        view.addSubview(tableView)
        setupTableView()
        registerCell()
        presenter.attachView(self)
        presenter.fetchTasks()
    }
    
    fileprivate func setupTableView() {
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.allowsSelection = true
        tableView.backgroundColor = .lightUltraGray
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        contentView.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(10)
            $0.right.equalTo(-10)
            
        }
    }
    
    fileprivate func registerCell() {
        tableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
        tableView.register(UINib(nibName: "PlaceDescCell", bundle: nil), forCellReuseIdentifier: "PlaceDescCell")
    }
}

extension PlaceViewController: PlaceView {
    func setHeaderTitle(title: String) {
        setupSearchNavigationBarLayout(title: title)
    }
    
    func setPlaceDetailView(place: Place) {
        let sectionHeader = Section()
        let headerView = HeaderView()
        headerView.titleHeader.text = place.titulo
        headerView.headerImageView.downloadCustom(url: place.urlFoto)
        headerView.starImageView.downloadCustom(url: place.urlLogo)
        sectionHeader.setHeaderView(withStaticView: headerView)
        sectionHeader.setHeaderHeight(withStaticHeight: 346)
        tableView.addSection(sectionHeader)
        sectionComments.addRow(PlaceDescCell.newRow(place: place, delegate: self))
    }
    
    func setComments(comments: [Comentario]) {
        comments.forEach { (comment) in
            sectionComments.addRow(CommentCell.newRow(comment: comment))
        }
        tableView.addSection(sectionComments)
        tableView.reloadData()
    }
}

extension PlaceViewController: PlaceDescCellDelegate {
    func goToServicos() {
        presenter.goToServices(viewController: self)
    }
    
    func showAdress(endereco: String) {
        let alert = UIAlertController(title: "Endereço", message: endereco, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func srollToComments() {
        DispatchQueue.main.async { [weak self] in
            let index = IndexPath(row: 1, section: 1)
            self?.tableView.scrollToRow(at: index, at: .middle, animated: true)
        }
    }
}
