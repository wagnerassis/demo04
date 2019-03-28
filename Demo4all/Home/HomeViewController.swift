import UIKit
import TableManager

class HomeViewController: BaseViewController {

    var tableView = UITableView()
    var presenter: HomePresenter
    
    //MARK: Init
    init(presenter: HomePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { return nil }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
        
        tableView.addRow(ItemCell.newRow(placeID: "a"))
        tableView.addRow(ItemCell.newRow(placeID: "a"))
        tableView.addRow(ItemCell.newRow(placeID: "a"))
        tableView.addRow(ItemCell.newRow(placeID: "a"))
        tableView.addRow(ItemCell.newRow(placeID: "a"))
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
        tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
    }
    
    fileprivate func setupActionTableView(placeList: [String]) {
        tableView.clearRows()
        placeList.forEach { placeID in
            let row = ItemCell.newRow(placeID: placeID)
            row.setDidSelect({ [weak self] (row, tableView, indexPath) in
                guard let welf = self else { return }
                welf.presenter.goToDetail(placeID: placeID, viewController: welf)
            })
            tableView.addRow(row)
            tableView.addSpace(height: 1)
        }
        
        tableView.reloadData()
    }
}

