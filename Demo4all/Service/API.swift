 import Foundation
 import Alamofire
 
 struct API {
    private static let base_url = "http://dev.4all.com:3003/"

    static func get(_ url: URLs, completion: @escaping (DataResponse<Any>) -> Void) {
        Alamofire.request("\(base_url)\(url.path)", method: .get)
            .responseJSON { (response) in
              completion(response)
        }
    }
    
 }
