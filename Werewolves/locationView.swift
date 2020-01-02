//
//  locationView.swift
//  Werewolves
//
//  Created by User09 on 2020/1/2.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI

struct locationView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<locationView>) -> locationViewController {
        let storyboard = UIStoryboard(name: "main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "locationViewController") as! locationViewController
        return controller
    }
    
    func updateUIViewController(_ uiViewController: locationViewController, context: UIViewControllerRepresentableContext<locationView>) {
        
    }
    
    
    
}
