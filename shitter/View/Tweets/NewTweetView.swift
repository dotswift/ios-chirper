import SwiftUI

struct NewTweetView: View {
    @Binding var isPresented: Bool
    @State var captionText: String = ""
    
    var body: some View {
        NavigationView{
            VStack {
                HStack(alignment: .top ){
                    Image("shilling")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                    
                    TextArea("What's happening?????", text: $captionText)
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