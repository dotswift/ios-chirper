import Foundation

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "spiderman", messageText: "hi", isCurrentUser: true),
    .init(id: 1, imageName: "shilling", messageText: "starwars", isCurrentUser: false),
    .init(id: 2, imageName: "batman", messageText: "die hard is better", isCurrentUser: true),
    .init(id: 3, imageName: "spiderman", messageText: "you've got mail", isCurrentUser: true),
    .init(id: 4, imageName: "spiderman", messageText: "big bobby", isCurrentUser: true),
    .init(id: 5, imageName: "shilling", messageText: "favorite uncle", isCurrentUser: false),
]
