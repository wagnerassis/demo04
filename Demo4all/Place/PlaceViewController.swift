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
        view.addSubview(tableView)
        setupTableView()
        registerCell()
        
        tableView.tableHeaderView = HeaderView()
        tableView.sectionHeaderHeight = 400
        tableView.addRow(PlaceDescCell.newRow(placeID: ""))
        let sectionComments = Section()
        sectionComments.addRow(CommentCell.newRow(comment: ""))
        sectionComments.addRow(CommentCell.newRow(comment: ""))
        sectionComments.addRow(CommentCell.newRow(comment: ""))
        sectionComments.addRow(CommentCell.newRow(comment: ""))
        sectionComments.addRow(CommentCell.newRow(comment: ""))
        tableView.addSection(sectionComments)
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
            $0.edges.equalToSuperview()
        }
    }
    
    fileprivate func registerCell() {
        tableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
        tableView.register(UINib(nibName: "PlaceDescCell", bundle: nil), forCellReuseIdentifier: "PlaceDescCell")
    }
}
