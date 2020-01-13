//
//  mainTabView.swift
//  Werewolves
//
//  Created by User09 on 2020/1/7.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct mainTabView: View {
    //@State var show = false
    let observedData = getData()
    var body: some View {
        
        return TabView{
            ContentView().tabItem{
                Image(systemName: "person.fill")
                Text("Profile")
            }
            ResultTableView().tabItem{
                Image(systemName: "list.dash")
                Text("Assign")
            }
            homePageView().tabItem{
                Image(systemName: "house.fill")
                Text("Home")
            }
        }.edgesIgnoringSafeArea(.top).environmentObject(observedData)
       

    

        
        
    }
}

struct mainTabView_Previews: PreviewProvider {
    static var previews: some View {
        mainTabView().environmentObject(getData())
    }
}
