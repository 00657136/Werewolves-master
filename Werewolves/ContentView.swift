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
    @State var showAlert = false
    @State var showAlert1 = false
    @State var yesORnot = false
    @State var trueORfalse = false
    var body: some View {
        NavigationView{
        ZStack{
            Image("背景").resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity)
            
            VStack(alignment: .center, spacing: 5){
                HStack{
                    Text("信箱").frame(width: UIScreen.main.bounds.width*1/6, height: 30).padding(5).background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 144/255, green: 247/255, blue: 136/255), Color.init(red: 50/255, green: 204/255, blue: 188/255)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1))).cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 2))

            TextField(account, text: $account)
            .textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: UIScreen.main.bounds.width*2/3, height: 50)
            }
                HStack{
                    Text("密碼").frame(width: UIScreen.main.bounds.width*1/6, height: 30).padding(5).background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 144/255, green: 247/255, blue: 136/255), Color.init(red: 50/255, green: 204/255, blue: 188/255)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1))).cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 2))
            TextField(password, text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: UIScreen.main.bounds.width*2/3, height: 50)
            }
                
                HStack{
            Text("註冊").onTapGesture {
                print(self.password)
                Auth.auth().createUser(withEmail: self.account, password: self.password) { (result, error) in
                            
                     guard let user = result?.user, error == nil else {
                        self.showAlert1 = true
                        self.trueORfalse = false
                         print(error?.localizedDescription)
                         return
                     }
                    self.showAlert1 = true
                    self.trueORfalse = true
                     print(user.email)
                }
            }.frame(width: UIScreen.main.bounds.width*1/6, height: 30).padding(5).background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 144/255, green: 247/255, blue: 136/255), Color.init(red: 50/255, green: 204/255, blue: 188/255)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1))).cornerRadius(5)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 2))
                .alert(isPresented: self.$showAlert1) { () -> Alert in
                    if self.trueORfalse == true {
                    return Alert(title: Text("註冊成功"), dismissButton: .default(Text("我知道了")))
                        }
                        else  {
                            return Alert(title: Text("此信箱已註冊"), dismissButton: .default(Text("我知道了")))
                        }
                
                }
                    
                    
                    
                Text("登入").onTapGesture {
                    Auth.auth().signIn(withEmail: self.account, password: self.password) { (result, error) in
                                guard error == nil else {
                                    print(error?.localizedDescription)
                                    return
                                }
                                
                    }
                   
                    
                }.frame(width: UIScreen.main.bounds.width*1/6, height: 30).padding(5).background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 144/255, green: 247/255, blue: 136/255), Color.init(red: 50/255, green: 204/255, blue: 188/255)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1))).cornerRadius(5)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 2))
                    
                
                
                
                
                
                
                Text("登出").onTapGesture {
                    do {
                       try Auth.auth().signOut()
                    } catch {
                       print(error)
                    }
                }.frame(width: UIScreen.main.bounds.width*1/6, height: 30).padding(5).background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 144/255, green: 247/255, blue: 136/255), Color.init(red: 50/255, green: 204/255, blue: 188/255)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1))).cornerRadius(5)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 2))
                Text("是否登入").onTapGesture {
                     if let user = Auth.auth().currentUser {
                        self.showAlert = true
                        self.yesORnot = true
                                           print("\(user.email) login")
                                       } else {
                        self.showAlert = true
                        self.yesORnot = false
                                           print("not login")
                                       }
                }.frame(width: UIScreen.main.bounds.width*1/5, height:30).padding(5).background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 144/255, green: 247/255, blue: 136/255), Color.init(red: 50/255, green: 204/255, blue: 188/255)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1))).cornerRadius(5)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 2))
                    .alert(isPresented: self.$showAlert) { () -> Alert in
                        if self.yesORnot == true {
                    return Alert(title: Text("已登入"), dismissButton: .default(Text("我知道了")))
                        }
                        else {
                            return Alert(title: Text("未登入"), dismissButton: .default(Text("我知道了")))
                        }
                    }
                    

            }
                HStack(alignment: .top,spacing:30){
            google().frame(width: UIScreen.main.bounds.width*2/5, height:50)
                facebook(account: account).frame(width: UIScreen.main.bounds.width*2/5, height:50)
            }
                
                NavigationLink(destination: ProfileView(account: account)){
                Text("profile")
                }.accentColor(.black).frame(width: UIScreen.main.bounds.width*4/5, height:30).padding(5).background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 144/255, green: 247/255, blue: 136/255), Color.init(red: 50/255, green: 204/255, blue: 188/255)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1))).cornerRadius(5)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 2))
                
                
                
                
                
        }
            
        }.edgesIgnoringSafeArea(.all)
    }
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
    var account : String
    func makeCoordinator() -> facebook.Coordinator {
        return facebook.Coordinator()
    }
    
    func makeUIView(context: UIViewRepresentableContext<facebook>) -> FBLoginButton {
        let button = FBLoginButton()
        button.permissions = ["email"]
        //account = ["email"]
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
