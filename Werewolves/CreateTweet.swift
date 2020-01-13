//
//  CreateTweet.swift
//  Werewolves
//
//  Created by User09 on 2020/1/13.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI
import Firebase


struct CreateTweet : View {
    @Binding var show : Bool
    @State var txt = ""
    @State private var mapshow = false
    @State var picker = false
    @State var picData : Data = .init(count: 0)
    @State var loading = false
    var body : some View{

        VStack{
            
            HStack{
                
                Button(action: {
                        
                    self.show.toggle()
                    
                }) {
                    
                    Text("Cancel")
                }
                
                Spacer()
                
//                Button("打卡") {
//                                   self.mapshow = true
//                               }
//                               .sheet(isPresented: $mapshow) {
//                                   locationView()
//                               }
                               
                
                
                Spacer()
                if loading{
                    ActivityIndicator()
                }
                else{
                    Button(action:{
                        self.picker.toggle()
                        
                    }){
                        Image("image").renderingMode(.original).resizable().scaledToFit().frame(width:30,height: 30)                    }
                }
                
                
                Button(action: {
                    
                    if self.picData.count != 0{
                        self.postPic()
                        self.loading.toggle()
                        return
                    }
                    postTweet(Content: self.txt,pic: "")
                    self.show.toggle()
                    
                }) {
                    
                    Text("完成").padding()
                    
                }
                .foregroundColor(.blue)
                .clipShape(Capsule())
            }
            
            multilineTextField(txt: $txt)
            
        }.padding()
        
            .sheet(isPresented: $picker){
                imagePicker(picker: self.$picker, picData: self.$picData)
        }
    }
    
    func postPic(){
        let storage = Storage.storage().reference()
        let id = "\(Int(Date().timeIntervalSince1970))"
        storage.child("pics").child(id).putData(self.picData, metadata: nil){
            (_,err)in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            storage.child("pics").child(id).downloadURL{(url,err) in
                if err != nil{
                    print((err?.localizedDescription)!)
                    return
                }
                
                postTweet(Content: self.txt, pic: "\(url!)")
                self.show.toggle()
            }
        }
    }
    
}


struct imagePicker : UIViewControllerRepresentable {
    @Binding var picker : Bool
    @Binding var picData : Data
    
    func makeCoordinator() -> imagePicker.Coordinator {
        return imagePicker.Coordinator(PastImagePicker1: self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<imagePicker>) -> UIImagePickerController{
        let picker1 = UIImagePickerController()
        picker1.sourceType = .photoLibrary
        picker1.delegate = context.coordinator
        return picker1
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<imagePicker>) {
        
    }
    
    class Coordinator : NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        var PastImagePicker : imagePicker
        init(PastImagePicker1: imagePicker){
            PastImagePicker = PastImagePicker1
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.PastImagePicker.picker.toggle()
            
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[.originalImage] as! UIImage
            let picdata = image.jpegData(compressionQuality: 0.25)
            self.PastImagePicker.picData = picdata!
            self.PastImagePicker.picker.toggle()
        }
        
    }
}

struct ActivityIndicator : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        let ActivityIndicator1 = UIActivityIndicatorView(style: .large)
        ActivityIndicator1.startAnimating()
        return ActivityIndicator1
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        
    }
}
