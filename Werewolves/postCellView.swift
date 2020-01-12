//
//  postCellView.swift
//  Werewolves
//
//  Created by User09 on 2020/1/12.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI

struct postCellView: View {
        
        var body : some View{
            
            HStack(spacing : 40){
                
                Button(action: {
                    
                }) {
                    
                    Image("Comments").resizable().frame(width: 20, height: 20)
                    
                }.foregroundColor(.gray)
                
                Button(action: {
                    
                }) {
                    
                    Image("Reply").resizable().frame(width: 20, height: 20)
                    
                }.foregroundColor(.gray)
                
                Button(action: {
                    
                }) {
                    
                    Image("love").resizable().frame(width: 20, height: 17)
                    
                }.foregroundColor(.gray)
                
                Button(action: {
                    
                }) {
                    
                    Image("upload").resizable().frame(width: 20, height: 20)
                    
                }.foregroundColor(.gray)
            }
        }
    }



