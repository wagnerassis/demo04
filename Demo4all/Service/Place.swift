import Foundation

struct Place: Codable {
    let id: String
    let cidade: String
    let bairro: String
    let urlFoto: String
    let urlLogo: String
    let titulo: String
    let telefone: String
    let texto: String
    let endereco: String
    let latitude: Double
    let longitude: Double
    let comentarios: [Comentario]
}

struct Comentario: Codable {
    let urlFoto: String
    let nome: String
    let nota: Int
    let titulo: String
    let comentario: String
}
