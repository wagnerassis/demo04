import Foundation
import Alamofire

struct PlaceService {
    public static func fetchTarefas(completion: @escaping ([String]?, String?) -> Void) {
        API.get(.tasks) { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let responseList = try decoder.decode(PlaceList.self, from: data)
                completion(responseList.lista, nil)
            } catch let error {
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public static func fetchTarefa(placeId: String, completion: @escaping (Place?, String?) -> Void) {
        API.get(.task(id: placeId)) { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let place = try decoder.decode(Place.self, from: data)
                completion(place, nil)
            } catch let error {
                completion(nil, error.localizedDescription)
            }
        }
    }
    
}
