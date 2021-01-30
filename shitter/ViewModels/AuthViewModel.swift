import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? // keeps track of if user is logged in
    @Published var user: User? // keeps track of user, so we can store user data
    
    static let shared = AuthViewModel() // shared instance will be able to access user wherever we want in the app
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
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
            guard let data = snapshot?.data() else {
                print("[Error] fetchUser() failed, snapshot data failed to load")
                return
            }
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
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    
                    if error != nil  {
                        print("[Error] registerUser() failed to create user = \(error?.localizedDescription)")
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
