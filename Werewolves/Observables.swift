//
//  Observables.swift
//  Werewolves
//
//  Created by User09 on 2020/1/13.
//  Copyright © 2020 Claudio. All rights reserved.
//
import Foundation
import SwiftUI
import Firebase


class getData : ObservableObject{
    
    @Published var datas = [Datatype]()

    
    init() {
        
        let db = Firestore.firestore()
        
        db.collection("post").addSnapshotListener { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges{
                
                if i.type == .added{
                    
                    
                    let id = i.document.documentID
                    let name = i.document.get("name") as! String
                    let Content = i.document.get("Content") as! String
                    let pic = i.document.get("pic") as! String
                    let url = i.document.get("url") as! String
                    let reply = i.document.get("reply") as! String
                    let likes = i.document.get("likes") as! String
                    let tagID = i.document.get("id") as! String
                    
                    DispatchQueue.main.async {
                        
                        self.datas.append(Datatype(id: id, name: name, Content: Content, reply: reply, likes: likes, pic: pic, url: url, tagId: tagID))
                    }
                    
                }
            }
        }
        
        
        
        
    }
}


func postTweet(Content : String,pic: String){
    
    let db = Firestore.firestore()

    
    db.collection("post").document().setData(["name" : "王嘉爾","id":"@jacksonWang","Content":Content,"reply":"0","likes":"0","pic":pic,"url":"https://firebasestorage.googleapis.com/v0/b/werewolves-e1f2f.appspot.com/o/jackson.jpg?alt=media&token=1531579e-1e5a-40fa-bd2f-d1fc996e9963"]) { (err) in
        
        if err != nil{
            
            print((err?.localizedDescription)!)
            
            return
        }
        print("success")
    }
}
