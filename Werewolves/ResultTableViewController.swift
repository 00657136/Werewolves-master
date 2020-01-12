//
//  ResultTableViewController.swift
//  Werewolves
//
//  Created by User09 on 2020/1/7.
//  Copyright © 2020 Claudio. All rights reserved.
//

import UIKit
import CoreData

class ResultTableViewController: UITableViewController {

    var container: NSPersistentContainer!
    var results = [Result]()
    
    func getResult(){
  
        let context = container.viewContext

        let request:NSFetchRequest<Result> = Result.fetchRequest()
        do {
            results = try context.fetch(request)
        }
        catch {
            print("error")
        }
    }
    
//    func getResult() {
//        let context = container.viewContext
//        let request:NSFetchRequest<Result> = Result.fetchRequest()
//        request.predicate = NSPredicate(format: "singer == %@ AND star > %d", "wiz", 1)
//        let sortDescriptor = NSSortDescriptor(key: "star", ascending: false)
//        request.sortDescriptors = [sortDescriptor]
//
//        do {
//            results = try context.fetch(request)
//        }
//        catch {
//            print("error")
//        }
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        getResult()
//        tableView.reloadData()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 165
        tableView.estimatedRowHeight = 0

        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        container = appDelegate?.persistentContainer
        print("3")
//        guard container != nil else {
//            fatalError("This view needs a persistent container.")
//        }
        
        getResult()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return results.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultIdentifier", for: indexPath)

        // Configure the cell...

        cell.textLabel?.text = results[indexPath.row].identity
        cell.textLabel?.numberOfLines = 4
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
            let controller = segue.destination as? assignViewController
            controller?.delegate = self
            controller?.container = self.container
        }
        

    }

    extension ResultTableViewController: AddResultTableViewControllerDelegate {
        
        func didAdd(result: Result) {
            results.append(result)
            tableView.reloadData()
        }
    

}
