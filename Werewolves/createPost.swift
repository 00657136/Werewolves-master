//
//  createPost.swift
//  Werewolves
//
//  Created by User09 on 2020/1/13.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI
import Firebase


struct createPost: View {
    @Binding var show : Bool
       @State var txt = ""

       var body : some View{

           VStack{
               
               HStack{
                   
                   Button(action: {
                           
                       self.show.toggle()
                       
                   }) {
                       
                       Text("Cancel")
                   }
                   
                   Spacer()
                   
                   Button(action: {
                       
                       
                       postTweet(msg: self.txt)
                       self.show.toggle()
                       
                   }) {
                       
                       Text("Tweet").padding()
                       
                   }.background(Color("bg"))
                   .foregroundColor(.white)
                   .clipShape(Capsule())
               }
               
               multilineTextField(txt: $txt)
               
           }.padding()
       }
}


