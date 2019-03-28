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
        setupNavigationLayout()
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
    
    func setupNavigationBarLayout(title: String = "") {
        self.title = title
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        let yourBackImage = UIImage(named: "backButton_icon")
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
    }
    
    func setupNavigationLayout() {
        navigationItem.title = ""
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationItem.hidesBackButton = false
    }
    
    func setupTabbarNavigationLayout(title: String) {
        tabBarController?.title = title
    }
    
    func setupContent() {
        contentView = UIView()
        view.addSubview(contentView)
        contentView.backgroundColor = .clear
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func updateBackgroundScene(image: UIImage?) {
        guard let image = image else { return }
        guard let imageScaled = image.scaleImageToSize(size: view.bounds.size) else { return }
        view.backgroundColor = UIColor(patternImage: imageScaled)
    }

}

extension BaseViewController: UIGestureRecognizerDelegate { }
