import UIKit

extension UIView {
    func addSubviews(views: [UIView]) {
        views.forEach { (view) in
            addSubview(view)
        }
    }
    
    func addShadow(){
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4.0
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
