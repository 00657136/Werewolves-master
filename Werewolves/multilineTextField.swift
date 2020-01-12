//
//  multilineTextField.swift
//  Werewolves
//
//  Created by User09 on 2020/1/13.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI

struct multilineTextField : UIViewRepresentable {
    
    
    @Binding var txt : String
    
    func makeCoordinator() -> multilineTextField.Coordinator {
        
        return multilineTextField.Coordinator(text1 : self)
    }
    func makeUIView(context: UIViewRepresentableContext<multilineTextField>) -> UITextView {
        
        let text = UITextView()
        text.isEditable = true
        text.isUserInteractionEnabled = true
        text.text = "Type Something"
        text.textColor = .gray
        text.font = .systemFont(ofSize: 20)
        text.delegate = context.coordinator
        return text
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<multilineTextField>) {
        
        
    }
    
    class Coordinator : NSObject,UITextViewDelegate{
        
        
        var text0 : multilineTextField
        
        init(text1 : multilineTextField) {
            
            text0 = text1
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            
            textView.text = ""
            textView.textColor = .black
        }
        
        func textViewDidChange(_ textView: UITextView) {
            
            self.text0.txt = textView.text
        }
    }
}
