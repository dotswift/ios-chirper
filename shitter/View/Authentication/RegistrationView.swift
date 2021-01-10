import SwiftUI

struct RegistrationView: View {
    @State var email = ""
    @State var password = ""
    @State var fullName = ""
    @State var userName = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    // variable that keeps track of the presentation mode that app is currently utilzing
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .padding(.top, 50)
                        .padding(.bottom, 16)
                        .foregroundColor(.yellow)
                    
                    VStack(spacing: 20){
                        CustomTextField(text: $email, placeholder: Text("E-Mail"), imageName: "envelope")
                            .padding() // this padding spreads text field dimensions
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(30)
                            .foregroundColor(.white)
                        
                        CustomTextField(text: $fullName, placeholder: Text("Full Name"), imageName: "figure.walk")
                            .padding() // this padding spreads text field dimensions
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(30)
                            .foregroundColor(.white)
                        
                        CustomTextField(text: $userName, placeholder: Text("User Name"), imageName: "figure.wave")
                            .padding() // this padding spreads text field dimensions
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(30)
                            .foregroundColor(.white)
                        
                        CustomTextField(text: $password, placeholder: Text("password"), imageName: "tortoise")
                            .padding() // this padding spreads text field dimensions
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(30)
                            .foregroundColor(.white)
                        
                    }
                    .padding(.horizontal, 32)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Register your Restaurant")
                            .font(.headline)
                            .foregroundColor(.yellow)
                            .frame(width: 360, height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .padding()
                    })
                    
                    Spacer()
                    
                    Button(action:  {mode.wrappedValue.dismiss()}, label: {
                        HStack {
                            Text("Already have an account?")
                                
                                .font(.system(size: 14, weight: .semibold))
                            
                            Text("Sign in here.")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                    })
                }
                .background(Color(.brown))
            }
            .background(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
            .ignoresSafeArea()
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
