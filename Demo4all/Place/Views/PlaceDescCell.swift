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
        row.setHeight(withStaticHeight: 305)
        row.setConfiguration { (row, cell, indexPath) in
            guard let cell = cell as? PlaceDescCell else { return }
            cell.selectionStyle = .none
            cell.locationLogoView.rounded()
            cell.addShadow()
        }
        return row
    }
    
    @IBAction func tapLigar(_ sender: UIButton) {
        print("ligar")
    }
    
    @IBAction func tapServicos(_ sender: UIButton) {
    }
    
    @IBAction func tapEndereco(_ sender: UIButton) {
    }
    
    @IBAction func tapComentarios(_ sender: UIButton) {
    }
    
    @IBAction func tapFavoritos(_ sender: UIButton) {
    }
    
    
}
