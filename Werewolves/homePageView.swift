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
        ZStack{
   
            VStack(alignment:.leading){
            
                HStack(alignment: .top){

                        AnimatedImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/werewolves-e1f2f.appspot.com/o/jackson.jpg?alt=media&token=1531579e-1e5a-40fa-bd2f-d1fc996e9963")).resizable().scaledToFill().frame(width: 50, height: 50).clipShape(Circle())

                    VStack(alignment: .leading){
                        
                        Text("王嘉爾").fontWeight(.heavy)
                        Text("@jacksonWang").foregroundColor(Color.gray).underline()
                        //Text(Content).padding(.top, 20)
                        
                    }
                    
                }.padding()
                
        NavigationView{
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    VStack(alignment: .leading){
                        
                        ForEach(observedData.datas){i in
                            
                            tweetCellTop(name: i.name, id: i.tagId, pic: i.pic, image: i.url, Content: i.Content)
                            
                            if i.pic != ""{
                                
                                tweetCellMiddle(pic: i.pic).padding(.leading, 60)
                                
                            }
                            

                            tweetCellBottom().offset(x: UIScreen.main.bounds.width / 4)
                        }
                    }
                    
                }

            .navigationBarTitle("動態",displayMode: .inline)
//            .navigationBarItems(leading:
//
//                Image("User Image").resizable().frame(width: 35, height: 35).clipShape(Circle()).onTapGesture {
//
//                    print("slide out menu ....")
//                }
//
//            )
        }
            
        }
                        
            VStack{
                Spacer()
                HStack{
                    Spacer()
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    //Text("貼文")
                    Image("pencil").renderingMode(.original).resizable().frame(width: 50, height: 50).padding()
                    }.padding()
                }.padding(.bottom,65)
            }.sheet(isPresented: $show) {
                
                CreateTweet(show: self.$show)
            }
                        
                        
                    }
    }
        
    
}



struct homePageView_Previews: PreviewProvider {
    static var previews: some View {
        homePageView().environmentObject(getData())
    }
}

