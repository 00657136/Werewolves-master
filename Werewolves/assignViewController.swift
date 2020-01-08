//
//  assignViewController.swift
//  Werewolves
//
//  Created by User09 on 2020/1/7.
//  Copyright © 2020 Claudio. All rights reserved.
//

import UIKit
import CoreData

protocol AddResultTableViewControllerDelegate {
    func didAdd(result: Result)
}

class assignViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var delegate: AddResultTableViewControllerDelegate?
    var container: NSPersistentContainer!
    
    
    func  numberOfItemsInSection(in collectionView:UICollectionView)-> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Role", for: indexPath) as! CollectionViewCell
        cell.cellImage.image = UIImage(named: "unknown")
        cell.cellImage.clipsToBounds = true
        cell.cellImage.layer.cornerRadius = 25

        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let selectedCell:UICollectionViewCell = collectionViewControl.cellForItem(at: indexPath)!
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
  
        if wolf.quantity > 0 {
            playerArray[indexPath.item] = "\(indexPath.item+1)號玩家為"+wolf.identity
            cell.cellImage.image = UIImage(named: wolf.identity)
            procedureText.text = "請選擇\(wolf.identity)"
            wolf.quantity -= 1
            if wolf.quantity == 0{
                wolf.pick = false
                prophet.pick = true
            }
        }
        else if prophet.quantity > 0{
            playerArray[indexPath.item] = "\(indexPath.item+1)號玩家為"+prophet.identity
            cell.cellImage.image = UIImage(named: prophet.identity)
            procedureText.text = "請選擇\(prophet.identity)"
            prophet.quantity -= 1
            if prophet.quantity == 0{
                prophet.pick = false
                witch.pick = true
            }
        }
        else if witch.quantity > 0{
            playerArray[indexPath.item] = "\(indexPath.item+1)號玩家為"+witch.identity
            cell.cellImage.image = UIImage(named: witch.identity)
            procedureText.text = "請選擇\(witch.identity)"
            witch.quantity -= 1
            if witch.quantity == 0{
                witch.pick = false
                knight.pick = true
            }
        }
        else if knight.quantity > 0{
            playerArray[indexPath.item] = "\(indexPath.item+1)號玩家為"+knight.identity
            cell.cellImage.image = UIImage(named: knight.identity)
            procedureText.text = "請選擇\(knight.identity)"
            knight.quantity = knight.quantity - 1
            if knight.quantity == 0{
                knight.pick = false
                beian.pick = true
            }
        }
        else if beian.quantity > 0{
            playerArray[indexPath.item] = "\(indexPath.item+1)號玩家為"+beian.identity
            cell.cellImage.image = UIImage(named: beian.identity)
            procedureText.text = "請選擇\(beian.identity)"
            beian.quantity = beian.quantity - 1
            if beian.quantity == 0{
                beian.pick = false
                pickComplete = true
            }
        }
    }
    

    
    
    @IBOutlet weak var collectionViewControl: UICollectionView!
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var procedureText: UILabel!
    var pickComplete : Bool = false
    var playerArray: [String] = ["player1","player2","player3","player4","player5","player6","player7","player8","player9"]
    struct assignRole{
        //let number : Int
        var pick : Bool
        var quantity : Int
        let identity : String
        init(pick : Bool,quantity : Int,identity : String) {
            self.pick = pick
            self.quantity = quantity
            self.identity = identity
        }
    }
    var rolenumber : Int = 0
    var wolf = assignRole( pick: true, quantity: 3, identity: "狼人")
    var prophet = assignRole( pick: false, quantity: 1, identity: "預言家")
    var witch = assignRole( pick: false, quantity: 1, identity: "女巫")
    var knight = assignRole( pick: false, quantity: 1, identity: "騎士")
    var beian = assignRole( pick: false, quantity: 3, identity: "平民")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        collectionLayout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        collectionLayout.itemSize = CGSize(width: 107, height: 107)
        collectionLayout.scrollDirection = .vertical
        // Do any additional setup after loading the view.
    }
    


    @IBAction func done(_ sender: Any) {
        let context = container.viewContext
        let result = Result(context: context)
        result.text = "1"
        container.saveContext()
        delegate?.didAdd(result: Result)
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
