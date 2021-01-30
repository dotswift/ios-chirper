import SwiftUI
import Kingfisher

struct TweetCell: View {
    let tweet: Tweet
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .top, spacing: 12){ // spacing creates room between picture and username/text
                
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) { // leading = left
                    HStack {
                        Text(tweet.fullName)
                            .font(.system(size: 14, weight : .semibold))
                            .foregroundColor(.black)
                        Text(tweet.userName)
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight : .bold))
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight : .bold))
                    }
                    
                    Text(tweet.caption)
                        .foregroundColor(.black)
                    
                }
            }
            .padding(.bottom)
            .padding(.trailing)
            
            TweetActionsView(tweet: tweet)
            Divider() // divider line under cell automatically rendered
        }
        .padding(.leading, -16)
    }
}
