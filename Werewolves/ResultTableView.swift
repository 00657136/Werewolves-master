//
//  ResultTableView.swift
//  Werewolves
//
//  Created by User09 on 2020/1/7.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI

struct ResultTableView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<ResultTableView>) -> assignNavigationViewController {
        let storyboard = UIStoryboard(name: "main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "assignNavigationView") as! assignNavigationViewController
        return controller
    }
    
    func updateUIViewController(_ uiViewController: assignNavigationViewController, context: UIViewControllerRepresentableContext<ResultTableView>) {
        
    }
    
    
    
}
