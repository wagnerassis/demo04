import Foundation
import SnapKit
import UIKit

class ServicoViewController: BaseViewController {
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarLayout(title: "Serviços")
        view.backgroundColor = .lightUltraGray
        makeLabel()
    }
    
    fileprivate func makeLabel() {
        label.text = "Serviços"
        label.textColor = .orangeDefault
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.width.equalTo(150)
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
