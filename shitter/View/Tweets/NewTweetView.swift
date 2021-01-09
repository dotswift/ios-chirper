import SwiftUI

struct NewTweetView: View {
    @Binding var isPresented: Bool
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    Image("shilling")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                    Text("New Tweet..")
                        .foregroundColor(.gray)
                    Spacer() // moves to left side of sreen
                }
                .padding()
                .navigationBarItems(leading:
                                        Button(action: {
                                            isPresented.toggle()
                                        }, label: {
                                            Text("Cancel")
                                        }), trailing:
                                            
                                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                                Text("Tweet")
                                                    .padding(.horizontal)
                                                    .padding(.vertical, 8)
                                                    .background(Color.blue)
                                                    .foregroundColor(.white)
                                                    .clipShape(Capsule())
                                            }))
                Spacer()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(isPresented: .constant(true))
    }
}
