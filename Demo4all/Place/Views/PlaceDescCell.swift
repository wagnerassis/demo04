import Foundation
import UIKit
import TableManager
import MapKit

protocol PlaceDescCellDelegate: class {
    func goToServicos()
    func showAdress(endereco: String)
    func srollToComments()
}

class PlaceDescCell: UITableViewCell {

    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var serviceButton: UIButton!
    @IBOutlet weak var addressButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationLogoView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    
    private var place: Place?
    private weak var delegate: PlaceDescCellDelegate?
    
    static func newRow(place: Place, delegate: PlaceDescCellDelegate) -> Row {
        let row = Row(identifier: "PlaceDescCell")
        row.setHeight(withStaticHeight: 305)
        row.setConfiguration { (row, cell, indexPath) in
            guard let cell = cell as? PlaceDescCell else { return }
            cell.place = place
            cell.delegate = delegate
            cell.selectionStyle = .none
            cell.addressLabel.text = place.endereco
            cell.descLabel.text = place.texto
            cell.descLabel.textAlignment = .justified
            cell.locationLogoView.rounded()
            cell.setupMap(lati: place.latitude, longi: place.longitude)
            cell.addShadow()
        }
        return row
    }
    
    @IBAction func tapLigar(_ sender: UIButton) {
       call()
    }
    
    @IBAction func tapServicos(_ sender: UIButton) {
        delegate?.goToServicos()
    }
    
    @IBAction func tapEndereco(_ sender: UIButton) {
        delegate?.showAdress(endereco: place?.endereco ?? "No address found")
    }
    
    @IBAction func tapComentarios(_ sender: UIButton) {
        delegate?.srollToComments()
    }
    
    @IBAction func tapFavoritos(_ sender: UIButton) {
        
    }
    
    
    private func setupMap(lati: Double, longi: Double) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: lati, longitude: longi)
        mapView.addAnnotation(annotation)
        mapView.showAnnotations([annotation], animated: true)
        mapView.isUserInteractionEnabled = false
    }
    
    private func call() {
        if let place = place, let url = URL(string: "tel://\(place.telefone)") {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
