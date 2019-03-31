import Foundation
import TableManager
import UIKit
import SnapKit

class PlaceViewController: BaseViewController {
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
        setupSearchNavigationBarLayout(title: "Porto Alegre - Moinhos de Vento")
        view.backgroundColor = UIColor.lightUltraGray
        view.addSubview(tableView)
        setupTableView()
        registerCell()
        putCells()
    }
    
    fileprivate func setupTableView() {
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.allowsSelection = true
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
    
    fileprivate func putCells() {
        let sectionHeader = Section()
        sectionHeader.setHeaderView(withStaticView: HeaderView())
        sectionHeader.setHeaderHeight(withStaticHeight: 346)
        tableView.addSection(sectionHeader)
        let sectionComments = Section()
        sectionComments.addRow(PlaceDescCell.newRow(placeID: ""))
        sectionComments.addRow(CommentCell.newRow(comment: ""))
        sectionComments.addRow(CommentCell.newRow(comment: ""))
        sectionComments.addRow(CommentCell.newRow(comment: ""))
        sectionComments.addRow(CommentCell.newRow(comment: ""))
        sectionComments.addRow(CommentCell.newRow(comment: ""))
        tableView.addSection(sectionComments)
    }
}
