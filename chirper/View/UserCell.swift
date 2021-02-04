import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    // ^^ every user cell has to be initialized with a user
    var body: some View {
        // Need an HStack because we have image and text next to eachother (left /right)
        HStack(spacing: 12){
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(28)
            VStack(alignment: .leading, spacing: 4){
                Text(user.userName)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullName)
                    .font(.system(size: 14))
                
            }.foregroundColor(.black)
        }
    }
}

