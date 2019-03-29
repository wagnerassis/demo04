import Foundation

enum URLs {
    case tasks
    case task(id: String)
}

extension URLs {
    var path: String {
        switch self {
        case .tasks:
            return "tarefa/"
        case .task(let id):
            return "tarefa/\(id)"
        }
    }
}
