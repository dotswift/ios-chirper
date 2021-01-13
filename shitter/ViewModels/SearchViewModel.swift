import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        COLLECTION_USERS.getDocuments { snapshot,_  in
            guard let documents = snapshot?.documents else { return }
            // instead of a For Each loop
            self.users = documents.map({
                User(dictionary: $0.data()) // $0 is like an iterable variable in a For loop
            })
        }
    }
}
