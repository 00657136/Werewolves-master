//
//  TweetCellTop.swift
//  Werewolves
//
//  Created by User09 on 2020/1/13.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct tweetCellTop : View {
    
    var name = ""
    var id = ""
    var pic = ""
    var image = ""
    var Content = ""
    
    var body : some View{
        
        HStack(alignment: .top){
            
            VStack{
                
                AnimatedImage(url: URL(string: image)!).resizable().scaledToFill().frame(width: 50, height: 50).clipShape(Circle())

            }

            
            VStack(alignment: .leading){
                
                Text(name).fontWeight(.heavy)
                Text(id)
                Text(Content).padding(.top, 8)
                
            }
            
        }.padding()
    }
}
