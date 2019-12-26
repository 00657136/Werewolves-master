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
import GoogleSignIn
import FBSDKLoginKit
struct ContentView: View {
    @State private var account : String = ""
    @State private var password : String = ""
    var body: some View {
        
        ZStack{
            Image("背景").resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
            
            VStack(alignment: .center, spacing: 5){
                HStack{
                    Text("信箱")
            TextField(account, text: $account)
            .textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: UIScreen.main.bounds.width*2/3, height: 50)
            }
                HStack{
                    Text("密碼")
            TextField(password, text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: UIScreen.main.bounds.width*2/3, height: 50)
            }
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

            google().frame(width: 120, height: 50)
                facebook().frame(width: 120, height: 50)
        }
            
        }.edgesIgnoringSafeArea(.all)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct google : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<google>) -> GIDSignInButton {
        let button = GIDSignInButton()
        button.colorScheme = .dark
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        return button
    }
    func updateUIView(_ uiView: GIDSignInButton, context: UIViewRepresentableContext<google>) {
        
    }
    
    
}

struct facebook : UIViewRepresentable {
    
    func makeCoordinator() -> facebook.Coordinator {
        return facebook.Coordinator()
    }
    
    func makeUIView(context: UIViewRepresentableContext<facebook>) -> FBLoginButton {
        let button = FBLoginButton()
        button.permissions = ["email"]
        button.delegate = context.coordinator
        return button
    }
    func updateUIView(_ uiView: FBLoginButton, context: UIViewRepresentableContext<facebook>) {
        
    }
    class Coordinator : NSObject,LoginButtonDelegate{
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            if error != nil{
                print((error?.localizedDescription)!)
                return
            }
            
            if AccessToken.current != nil{
                let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
                Auth.auth().signIn(with: credential){(res,er) in
                    if er != nil{
                        print((error?.localizedDescription)!)
                    }
                    print("sucesses")
                }
            }
        }
        
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            try! Auth.auth().signOut()
        }
        
        
    }
}
