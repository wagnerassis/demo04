import Foundation
import UIKit
import TableManager
import MapKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var identificationLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    static func newRow(comment: Comentario) -> Row {
        let row = Row(identifier: "CommentCell")
        row.setHeight(withStaticHeight: 100)
        row.setConfiguration { (row, cell, indexPath) in
            guard let cell = cell as? CommentCell else { return }
            cell.photoImageView.rounded()
            cell.addShadow()
            
            cell.identificationLabel.textColor = .orangeDefault
            cell.commentLabel.textColor = .orangeDefault
            cell.photoImageView.downloadCustom(url: comment.urlFoto)
            cell.commentLabel.text = comment.comentario
            cell.identificationLabel.attributedText = NSAttributedString(string: "\(comment.nome)\n\(comment.titulo)")
        }
        return row
    }
}
