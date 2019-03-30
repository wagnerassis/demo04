import Foundation
import UIKit
import TableManager
import MapKit

class PlaceDescCell: UITableViewCell {

    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var serviceButton: UIButton!
    @IBOutlet weak var addressButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationLogoView: UIImageView!
    
    static func newRow(placeID: String) -> Row {
        let row = Row(identifier: "PlaceDescCell")
        row.setHeight(withStaticHeight: 319)
        row.setConfiguration { (row, cell, indexPath) in
            guard let cell = cell as? PlaceDescCell else { return }
            cell.addShadow()
        }
        return row
    }
}
