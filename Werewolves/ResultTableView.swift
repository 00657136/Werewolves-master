//
//  ResultTableView.swift
//  Werewolves
//
//  Created by User09 on 2020/1/7.
//  Copyright © 2020 Claudio. All rights reserved.
//

import SwiftUI

struct ResultTableView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<ResultTableView>) -> ResultTableViewController {
        let storyboard = UIStoryboard(name: "main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "ResultTableViewController") as! ResultTableViewController
        return controller
    }
    
    func updateUIViewController(_ uiViewController: ResultTableViewController, context: UIViewControllerRepresentableContext<ResultTableView>) {
        
    }
    
    
    
}
