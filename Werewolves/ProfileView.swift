//
//  ProfileView.swift
//  Werewolves
//
//  Created by User09 on 2020/1/2.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    var account : String
    @State private var showSelectPhoto = false
    @State private var selectImage : UIImage?
    @State private var show = false
    @EnvironmentObject var observedData : getData
    var body: some View {
        ZStack(alignment: .topLeading){
            
            Image("").resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
            VStack(alignment:.center,spacing:50){
                Image("").resizable().scaledToFit().frame(width:100).hidden()
                
                
                HStack(alignment: .center, spacing: 30) {
            ZStack(alignment: .bottom) {

                Group {
                    if selectImage != nil {
                        Image(uiImage: selectImage!)
                            .resizable()
                            .renderingMode(.original)
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                    }
                }
                .scaledToFill().frame(width:150,height: 150).cornerRadius(150)
            Button(action: {
                self.showSelectPhoto = true
            }) {
                Text("更換頭像").accentColor(.black).padding(5).background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 144/255, green: 247/255, blue: 136/255), Color.init(red: 50/255, green: 204/255, blue: 188/255)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1)))

                .cornerRadius(5)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 2))

            }
            }
                    Text(account).frame(width: UIScreen.main.bounds.width - 180,height: 100)
        }
                NavigationLink(destination: PostView()){
                    Text("狼人聊天室").frame(width:UIScreen.main.bounds.width - 50,height: 50).overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black,lineWidth: 2))
                }
                
                
                
                
        }
              
        .sheet(isPresented: $showSelectPhoto) {
            ImagePicker(showSelectPhoto: self.$showSelectPhoto, selectImage: self.$selectImage)
        }
        }.accentColor(.black).edgesIgnoringSafeArea(.all)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(account : "玩家ID")
    }
}
