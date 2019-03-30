import Foundation
import UIKit
import TableManager
import MapKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var PhotoImageView: UIImageView!
    @IBOutlet weak var identificationLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    static func newRow(comment: String) -> Row {
        let row = Row(identifier: "CommentCell")
        row.setHeight(withStaticHeight: 100)
        row.setConfiguration { (row, cell, indexPath) in
            guard let cell = cell as? CommentCell else { return }
            cell.PhotoImageView.rounded()
            cell.addShadow()
        }
        return row
    }
}
