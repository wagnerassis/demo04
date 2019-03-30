import Foundation
import UIKit
import SnapKit

class HeaderView: UIView {
    @IBOutlet var container: UIView!
    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var starImageView: UIImageView!
    
    @IBOutlet weak var titleHeader: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
        setupViews()
    }
    
    fileprivate func setupViews() {
        addSubview(container)
        container.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        starImageView.rounded()
    }
}
