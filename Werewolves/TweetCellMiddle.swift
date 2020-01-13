//
//  TweetCellMiddle.swift
//  Werewolves
//
//  Created by User09 on 2020/1/13.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct tweetCellMiddle : View {
    
    var pic = ""
    
    var body : some View{
        
        AnimatedImage(url: URL(string: pic)!).resizable().scaledToFill().frame(width:UIScreen.main.bounds.width*4/5,height: 300).cornerRadius(20).padding()
    }
}
