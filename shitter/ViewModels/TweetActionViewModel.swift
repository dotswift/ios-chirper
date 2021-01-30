import Firebase
import SwiftUI

class TweetActionViewModel: ObservableObject {
    
    let tweet: Tweet
    @Published var didLike = false
    
    init(tweet: Tweet){
        self.tweet = tweet
    }
    
    func likeTweet(){
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let tweetLikesRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
        
        
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes + 1]) { _ in
            
            tweetLikesRef.document(uid).setData([:]) { _ in
                
                userLikesRef.document(self.tweet.id).setData([:], completion: { _ in
                    self.didLike = true
                })
            }
        }
        
    }
    
    func unlikeTweet(){
        
    }
}

