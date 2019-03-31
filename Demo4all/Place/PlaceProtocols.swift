import Foundation

protocol PlaceView: class {
    func setHeaderTitle(title: String)
    func setTitle(title: String)
    func setPlaceDescView(place: Place)
    func setComments(comments: [Comentario])
}
