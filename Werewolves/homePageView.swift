//
//  homePageView.swift
//  Werewolves
//
//  Created by User09 on 2020/1/12.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore
import SDWebImageSwiftUI

struct homePageView : View {
    @State var show = false
    @EnvironmentObject var observedData : getData
    
    var body : some View{
        VStack{
        NavigationView{
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading){
                        
                        ForEach(observedData.datas){i in
                            
                            tweetCellTop(name: i.name, id: i.tagId, pic: i.pic, image: i.url, Content: i.Content)
                            
                            if i.pic != ""{
                                
                                tweetCellMiddle(pic: i.pic).padding(.leading, 60)
                                
                            }
                            

                            tweetCellBottom().offset(x: UIScreen.main.bounds.width / 4)
                        }
                    }
                    
                }.padding(.bottom, 15)

            .navigationBarTitle("Home",displayMode: .inline)
            .navigationBarItems(leading:
            
                Image("User Image").resizable().frame(width: 35, height: 35).clipShape(Circle()).onTapGesture {
                    
                    print("slide out menu ....")
                }
            
            )
        }
            
                        
                        Button(action: {
                            
                            self.show.toggle()
                            
                        }) {
                            
                            Image("pencil").resizable().frame(width: 20, height: 20).padding()
                        }
                        .foregroundColor(.white)
                        
                        
                    }.sheet(isPresented: $show) {
                
                CreateTweet(show: self.$show)
            }
    }
        
    
}

struct homePageView_Previews: PreviewProvider {
    static var previews: some View {
        homePageView()
    }
}

