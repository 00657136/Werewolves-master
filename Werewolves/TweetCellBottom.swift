//
//  TweetCellBottom.swift
//  Werewolves
//
//  Created by User09 on 2020/1/13.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI

struct tweetCellBottom : View {
    
    var body : some View{
        
        HStack(spacing : 40){
            
            Button(action: {
                
            }) {
                
                Image("Comments").renderingMode(.original).resizable().frame(width: 20, height: 20)
                
            }
            
            Button(action: {
                
            }) {
                
                Image("Reply").renderingMode(.original).resizable().frame(width: 20, height: 20)
                
            }
            
            Button(action: {
                
            }) {
                
                Image("love").renderingMode(.original).resizable().frame(width: 20, height: 17)
                
            }
            
            Button(action: {
                
            }) {
                
                Image("upload").renderingMode(.original).resizable().frame(width: 20, height: 20)
                
            }
        }
    }
}
