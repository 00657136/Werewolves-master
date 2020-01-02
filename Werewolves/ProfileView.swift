//
//  ProfileView.swift
//  Werewolves
//
//  Created by User09 on 2020/1/2.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @State private var showSelectPhoto = false
    @State private var selectImage : UIImage?
    @State private var show = false
    var body: some View {
        ZStack(alignment: .topLeading){
            
            Image("wallpaper").resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
            VStack(alignment:.leading){
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
            Text("玩家名字")
        }
                
                Button("play") {
                    self.show = true
                }
                .sheet(isPresented: $show) {
                    locationView()
                }
                
        }
              
        .sheet(isPresented: $showSelectPhoto) {
            ImagePicker(showSelectPhoto: self.$showSelectPhoto, selectImage: self.$selectImage)
        }
    }.edgesIgnoringSafeArea(.all)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
