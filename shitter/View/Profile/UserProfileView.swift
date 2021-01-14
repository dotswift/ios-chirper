import SwiftUI

struct UserProfileView: View {
    let user: User
    @ObservedObject var viewModel: ProfileViewModel // whenever the publised property gets updated, the UI changes
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeaderView(viewModel: viewModel, isFollowed: $viewModel.isFollowed)
                    .padding()
                
                ForEach(0..<9) { tweet in
                    TweetCell()
                        .padding()
                }
            }
            .navigationTitle("Shilling")
        }
    }
}
