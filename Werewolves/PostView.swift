//
//  PostView.swift
//  Werewolves
//
//  Created by User09 on 2020/1/12.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI

struct PostView: View {
    @State private var mapshow = false
    var name = ""
    var body: some View {
        VStack{
        Text("").navigationBarTitle("剩餘的功能",displayMode: .large)
            Button("打卡") {
                self.mapshow = true
            }
            .sheet(isPresented: $mapshow) {
                locationView()
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
