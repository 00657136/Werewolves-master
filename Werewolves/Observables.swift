//
//  Observables.swift
//  Werewolves
//
//  Created by User09 on 2020/1/13.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore

class getData : ObservableObject{
    
    @Published var datas = [Datatype]()
    //@Published var top = [Topdatatype]()
    
    init() {
        
        let db = Firestore.firestore()
        
        db.collection("post").addSnapshotListener { (snap, err) in
            
            if err != nil{
                print("N")
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges{
                
                if i.type == .added{
                    
                    print("hello world")
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


func postTweet(Content : String){
    
    let db = Firestore.firestore()
    
    // I'm going to use default name and image url.....
    
    db.collection("post").document().setData(["name" : "王嘉爾","id":"@jacksonWang","Content":Content,"reply":"0","likes":"0","pic":"","url":" Image URL "]) { (err) in
        
        if err != nil{
            
            print((err?.localizedDescription)!)
            
            return
        }
        print("success")
    }
}
