import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject{
    let user: User
    @Published var isFollowed = false
    
    init(user: User){
        self.user = user
    }
    func follow() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        // first add user to list of following for logged in user
        COLLECTION_FOLLOWING
            .document(currentUid)
            .collection("user-following")
            .document(user.id)
            .setData([:]) { _ in
                // then add user to list of followers
                COLLECTION_FOLLOWERS
                    .document(self.user.id)
                    .collection("user-followers")
                    .document(currentUid)
                    .setData([:]) { _ in
                        self.isFollowed = true
                    }
            }
    }
    
    func unfollow(){
        
    }
}
