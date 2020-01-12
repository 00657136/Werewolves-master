//
//  PostView.swift
//  Werewolves
//
//  Created by User09 on 2020/1/12.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI

struct PostView: View {
    
    var name = ""
    var body: some View {
        Text(name).navigationBarTitle("狼人溝通區",displayMode: .large)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
