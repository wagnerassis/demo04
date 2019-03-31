import UIKit
import SnapKit
import OCMixins
import IQKeyboardManagerSwift

class BaseViewController: UIViewController, TransparentNavigation {
    //MARK: Properties
    var contentView: UIView!
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContent()
        navigationController?.navigationBar.barTintColor = UIColor.orangeDefault
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,
                                                                   .font: UIFont(name: "HelveticaNeue", size: 12) ?? UIFont.systemFont(ofSize: 12)]
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    //MARK: Methods
    
    func setupSearchNavigationBarLayout(title: String = "") {
        navigationItem.title = title
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        navigationItem.hidesBackButton = false
        
        let searchImage = UIImage(named: "searchIco")?.scaleImageToSize(size: CGSize(width: 20, height: 20))
        let searchItem = UIBarButtonItem(image: searchImage, style: .plain, target: nil, action: nil)
        searchItem.title = ""
        navigationItem.rightBarButtonItem = searchItem
    }
    
    func setupNavigationBarLayout(title: String = "") {
        navigationItem.title = title
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        navigationItem.hidesBackButton = false
    }
    
    func setupContent() {
        contentView = UIView()
        view.addSubview(contentView)
        contentView.backgroundColor = .clear
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}

extension BaseViewController: UIGestureRecognizerDelegate { }
