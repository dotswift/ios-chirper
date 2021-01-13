import Foundation
import Firebase

struct User: Identifiable {
    let id: String
    let userName: String
    let profileImageUrl: String
    let fullName: String
    let email: String
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    
    init(dictionary: [String: Any]){
        self.id = dictionary["uid"] as? String ?? ""
        self.userName = dictionary["userName"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
    }
}
