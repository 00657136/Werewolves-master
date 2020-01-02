//
//  ImagePicker.swift
//  Werewolves
//
//  Created by User09 on 2020/1/2.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var showSelectPhoto: Bool
    @Binding var selectImage: UIImage?
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        Coordinator(self)
    }
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var imagePicker: ImagePicker

        init(_ imagePicker: ImagePicker) {
            self.imagePicker = imagePicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            imagePicker.selectImage = info[.originalImage] as? UIImage
            imagePicker.showSelectPhoto = false
        }
                               
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    
    
}
