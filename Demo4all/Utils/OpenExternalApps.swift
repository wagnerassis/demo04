import Foundation
import UIKit
import Contacts
import ContactsUI

class OpenExternalApps {
    static func openGoogleMaps(latitude: String, longitude: String) {
        if UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!) {
            let urlString = "comgooglemaps://?center=\(latitude),\(longitude)&zoom=20&views=traffic"
            UIApplication.shared.open(URL(string: urlString)!)
        } else {
            print("Can't use comgooglemaps://");
        }
    }
    
    static func saveNewContact(name: String, telefone: String, viewController: UIViewController) {
        let con = CNMutableContact()
        con.givenName = name
        con.phoneNumbers.append(CNLabeledValue(
            label: "woods", value: CNPhoneNumber(stringValue: telefone)))
        let unkvc = CNContactViewController(forUnknownContact: con)
        unkvc.message = "Estabelimento"
        unkvc.contactStore = CNContactStore()
        //unkvc.delegate = self
        unkvc.allowsActions = false
        viewController.pushViewController(unkvc)
    }
    
    static func openURL(url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
