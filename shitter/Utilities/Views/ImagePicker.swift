import SwiftUI

struct ImagePicker: UIViewControllerRepresentable { // wrapper to show ViewController in Swift UI
    
    func makeCoordinator() -> Coordinator { // The Coordinator helps the View Controller communicate with the SwiftUI functionality (its the link)
        Coordinator(self) // briging the gap between UIKit and SwiftUI
    }
    
    func makeUIViewController(context: Context) -> some UIViewController { // you  can put any view controller class in here (can be custom)
        let picker = UIImagePickerController() // for example, this is not natively available in SwiftUI, only un UIKit
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

extension ImagePicker {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        let parent: ImagePicker
        
        init(_ parent: ImagePicker){
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // this code is executed when we select an image from the image picker
        }
    }
}
