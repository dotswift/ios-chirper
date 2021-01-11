import SwiftUI

struct RegistrationView: View {
    @State var email = ""
    @State var password = ""
    @State var fullName = ""
    @State var userName = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage? // UIKit
    @State var image: Image? // Swift UI Image
    
    @ObservedObject var viewModel = AuthViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    // variable that keeps track of the presentation mode that app is currently utilzing
    
    func loadImage(){
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage) //  converts UIKit image to SwiftUI Image
    }
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    showImagePicker.toggle()
                    
                }, label: {
                    ZStack { // if an image has been selected show it, if not show plus_photo
                        if let image = image { // CONTROL FLOW // re-renders the state  variable $image
                            image // runs if image has a value
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipped()
                                .cornerRadius(70)
                                .padding(.top, 50)
                                .padding(.bottom, 16)
                            
                        } else {
                            Image("plus_photo")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .padding(.top, 50)
                                .padding(.bottom, 16)
                                .foregroundColor(.yellow)
                        }
                    }
                }).sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedUIImage) // when ImagePicker is dimissed, loadImage() is called
                })
                
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
                    
                    CustomSecureField(text: $password, placeholder: Text("password"), imageName: "tortoise")
                        .padding() // this padding spreads text field dimensions
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(30)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 32)
                
                Button(action: {
                    guard let image = selectedUIImage  else { return }
                    // why don't we use $ in front of email, password, etc
                    viewModel.registerUser(email: email, password: password, userName: userName, fullName: fullName, userImage: image)
                    
                }, label: {
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

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
