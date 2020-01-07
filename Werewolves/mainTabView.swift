//
//  mainTabView.swift
//  Werewolves
//
//  Created by User09 on 2020/1/7.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI

struct mainTabView: View {
    var body: some View {
        TabView{
            ProfileView().tabItem{
                Image(systemName: "person.fill")
                Text("Profile")
            }
            ResultTableView().tabItem{
                Image(systemName: "list.dash")
                Text("Assign")
            }
        }
    }
}

struct mainTabView_Previews: PreviewProvider {
    static var previews: some View {
        mainTabView()
    }
}
