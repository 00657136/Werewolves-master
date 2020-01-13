//
//  homePageView.swift
//  Werewolves
//
//  Created by User09 on 2020/1/12.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct homePageView : View {
    @State var show = false
    @EnvironmentObject var observedData : getData
    
    var body : some View{
        VStack{
   
            Button(action: {
                
                self.show.toggle()
                
            }) {
                Text("貼文")
                Image("pencil").renderingMode(.original).resizable().frame(width: 50, height: 50).padding()
            }
            
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
//            .navigationBarItems(leading:
//
//                Image("User Image").resizable().frame(width: 35, height: 35).clipShape(Circle()).onTapGesture {
//
//                    print("slide out menu ....")
//                }
//
//            )
        }
            
                        
                        
                        
                        
                    }.sheet(isPresented: $show) {
                
                CreateTweet(show: self.$show)
            }
    }
        
    
}



struct homePageView_Previews: PreviewProvider {
    static var previews: some View {
        homePageView().environmentObject(getData())
    }
}

