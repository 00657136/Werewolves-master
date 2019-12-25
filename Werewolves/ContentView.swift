//
//  ContentView.swift
//  Werewolves
//
//  Created by User21 on 2019/12/25.
//  Copyright © 2019 Claudio. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    @State private var account : String = ""
    @State private var password : String = ""
    var body: some View {
        
        ZStack{
            Color.init(.yellow)
            
            VStack{
            TextField(account, text: $account)
            .textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: UIScreen.main.bounds.width*2/3, height: 50)
            TextField(password, text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: UIScreen.main.bounds.width*2/3, height: 50)
            Text("註冊").onTapGesture {
                print(self.password)
                Auth.auth().createUser(withEmail: self.account, password: self.password) { (result, error) in
                            
                     guard let user = result?.user, error == nil else {
                         print(error?.localizedDescription)
                         return
                     }
                     print(user.email)
                }
            }
                Text("登入").onTapGesture {
                    Auth.auth().signIn(withEmail: self.account, password: self.password) { (result, error) in
                                guard error == nil else {
                                    print(error?.localizedDescription)
                                    return
                                }
                                
                    }
                   
                    
                }
                Text("登出").onTapGesture {
                    do {
                       try Auth.auth().signOut()
                    } catch {
                       print(error)
                    }
                }
                Text("是否登入").onTapGesture {
                     if let user = Auth.auth().currentUser {
                                           print("\(user.email) login")
                                       } else {
                                           print("not login")
                                       }
                }
            
        }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
