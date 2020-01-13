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
    var body : some View{

        VStack{
            
            HStack{
                
                Button(action: {
                        
                    self.show.toggle()
                    
                }) {
                    
                    Text("Cancel")
                }
                
                Spacer()
                
                Button("打卡") {
                                   self.mapshow = true
                               }
                               .sheet(isPresented: $mapshow) {
                                   locationView()
                               }
                               
                
                
                Spacer()
                
                Button(action: {
                    
                    
                    postTweet(Content: self.txt)
                    self.show.toggle()
                    
                }) {
                    
                    Text("完成").padding()
                    
                }
                .foregroundColor(.blue)
                .clipShape(Capsule())
            }
            
            multilineTextField(txt: $txt)
            
        }.padding()
    }
}
