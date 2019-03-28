import Foundation
import UIKit
import TableManager

class ItemCell: UITableViewCell {
    @IBOutlet weak var placeIdLabel: UILabel!
    
    static func newRow(placeID: String) -> Row {
        let row = Row(identifier: "ItemCell")
        row.setHeight(withStaticHeight: 80)
        row.setConfiguration { (row, cell, indexPath) in
            guard let cell = cell as? ItemCell else { return }
            cell.placeIdLabel.text = "Place ID: \(placeID)"
            cell.addShadow()
        }
        return row
    }
}
