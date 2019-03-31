import Foundation

protocol PlaceView: class {
    func setHeaderTitle(title: String)
    func setPlaceDetailView(place: Place)
    func setComments(comments: [Comentario])
}
