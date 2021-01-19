import Foundation
import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? // keeps track of if user is logged in
    @Published var isAuthenticating = false // is the process of signup / login ongoing?
    @Published var error: Error? // if we get an error when user is trying to login, it will be stored here for use in the UI
    @Published var user: User? // keeps track of user, so we can store user data
    
    static let shared = AuthViewModel() // through this shared instance will be able to access user wherever we want in the app
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    // why is withEmail here
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error  {
                print("[Error] login() failed to login, error = \(error.localizedDescription)")
                return
            }
            
            self.userSession = result?.user
            self.fetchUser()
        }
    }
    
    func logOut(){
        userSession = nil
        user = nil 
        try? Auth.auth().signOut()
    }
    
    func fetchUser(){
        guard let uid = userSession?.uid else { return }
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _  in
            guard let data = snapshot?.data() else { return }
            self.user = User(dictionary: data)
        }
    }
    
    func registerUser(email: String, password: String, userName: String,  fullName: String, userImage: UIImage){
        
        guard let imageData = userImage.jpegData(compressionQuality: 0.3) else { return }
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(fileName)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("[Error] registerUser() failed to upload image, error = \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return } // provides URL for the image
                
                // use the URL to upload the data to firebase
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    
                    if error != nil  {
                        return
                    }
                    
                    guard let user = result?.user else { return }
                    
                    let data = ["email": email,
                                "userName": userName.lowercased(),
                                "fullName": fullName,
                                "profileImageUrl": profileImageUrl,
                                "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        self.userSession = user
                        self.fetchUser()
                    }
                    
                }
            }
        }
    }
}
