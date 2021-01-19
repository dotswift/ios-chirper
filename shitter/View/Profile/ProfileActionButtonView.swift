import SwiftUI

struct ProfileActionButtonView: View {
    let viewModel: ProfileViewModel
    @Binding var isFollowed: Bool
    // needs to be a binding variable because our UI is going to be adjusted / updated based on the state of this variable (it will be passed in from parent)
    var body: some View {
        
        if viewModel.user.isCurrentUser{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color(.blue))
                    .foregroundColor(.white)
            })
            .cornerRadius(20) // divide the height by 2 to get the rounded edges (40/2)
            
        } else {
            HStack{
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .frame(width: 180, height: 40)
                        .background(Color(.yellow))
                        .foregroundColor(.black)
                })
                .cornerRadius(20) // divide the height by 2 to get the rounded edges (40/2)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Message")
                        .frame(width: 180, height: 40)
                        .background(Color(.brown))
                        .foregroundColor(.white)
                })
                .cornerRadius(20) // divide the height by 2 to get the rounded edges (40/2)
                
            }
        }
    }
}
