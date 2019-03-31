import Foundation
import Alamofire

struct PlaceService {
    public static func fetchTarefas(completion: @escaping ([String]?, String?) -> Void) {
        LoadingView.show()
        API.get(.tasks) { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let responseList = try decoder.decode(PlaceList.self, from: data)
                completion(responseList.lista, nil)
                LoadingView.dismiss()
            } catch let error {
                completion(nil, error.localizedDescription)
                LoadingView.dismiss()
            }
        }
    }
    
    public static func fetchTarefa(placeId: String, completion: @escaping (Place?, String?) -> Void) {
        LoadingView.show()
        API.get(.task(id: placeId)) { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let place = try decoder.decode(Place.self, from: data)
                completion(place, nil)
                LoadingView.dismiss()
            } catch let error {
                completion(nil, error.localizedDescription)
                LoadingView.dismiss()
            }
        }
    }
    
}
