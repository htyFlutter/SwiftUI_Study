import Foundation

struct ToDo: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}
