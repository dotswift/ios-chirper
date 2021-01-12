import SwiftUI

struct ImagePicker: UIViewControllerRepresentable { // wrapper to show ViewController in Swift UI
    @Binding var image: UIImage? // this is a UIImage (not a SwiftUI image) because below imagePickerController() returns a UIImage
    @Environment(\.presentationMode) var mode // adds ability to call .dismiss (line 34)
    
    func makeCoordinator() -> Coordinator { // The Coordinator helps the View Controller communicate with the SwiftUI functionality (its the link)
        Coordinator(self) // briging the gap between UIKit and SwiftUI
    }
    
    func makeUIViewController(context: Context) -> some UIViewController { // you  can put any view controller class in here (can be custom)
        let picker = UIImagePickerController() // for example, this is not natively available in SwiftUI, only un UIKitasdfas
        picker.delegate = context.coordinator //  in protocol oriented programming, you have to set the delegate property to make imagePickerController() get called
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

extension ImagePicker {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        let parent: ImagePicker // parent IS the Image Picker Struct (above)
        
        init(_ parent: ImagePicker){
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // this code is executed when we select an image from the image picker
            guard let image = info[.originalImage] as? UIImage else {return}
            parent.image = image // set the image
            parent.mode.wrappedValue.dismiss() // dismiss the view after setting the image
        }
    }
}
