import SwiftUI
import Kingfisher

struct TweetDetailView: View {
    let tweet: Tweet
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack{
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                VStack(alignment: .leading, spacing: 4){
                    Text(tweet.fullName)
                        .font(.system(size: 14, weight: .semibold))
                    Text("@\(tweet.userName)")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            
            Text(tweet.caption)
                .font(.system(size: 22))
            
            Text("7:22PM • 02/07/2007")
                .font(.system(size:14))
                .foregroundColor(.gray)
            
            Divider()
            
            HStack(spacing: 12){
                HStack(spacing:4){
                    Text("\(tweet.likes)")
                        .font(.system(size: 14, weight: .semibold))
                    Text("Retweets")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                }
                
                HStack(spacing:4){
                    
                    Text("435")
                        .font(.system(size: 14, weight: .semibold))
                    Text("Likes")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    
                }
                
            }
            Divider()
            TweetActionsView()
            Spacer()
        }
        .padding()
    }
}

