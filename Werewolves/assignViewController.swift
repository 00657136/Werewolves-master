//
//  assignViewController.swift
//  Werewolves
//
//  Created by User09 on 2020/1/7.
//  Copyright © 2020 Claudio. All rights reserved.
//

import UIKit

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

class assignViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    func  numberOfItemsInSection(in collectionView:UICollectionView)-> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Role", for: indexPath) as! CollectionViewCell
        cell.cellImage.image = UIImage(named: "unknown")
        cell.cellButton.tag = indexPath.row
        cell.cellButton.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
        cell.cellImage.clipsToBounds = true
        cell.cellImage.layer.cornerRadius = 25
        if wolf.pick == true && rolenumber == indexPath.row {
            cell.cellImage.image = UIImage(named: wolf.identity)
        }
        if prophet.pick == true && rolenumber == indexPath.row {
            cell.cellImage.image = UIImage(named: prophet.identity)
        }
       if witch.pick == true && rolenumber == indexPath.row{
            cell.cellImage.image = UIImage(named: witch.identity)
        }
        if knight.pick == true && rolenumber == indexPath.row{
            cell.cellImage.image = UIImage(named: knight.identity)
        }
        if beian.pick == true && rolenumber == indexPath.row{
            cell.cellImage.image = UIImage(named: beian.identity)
        }
        
        
        return cell
    }
    
    @IBOutlet weak var collectionViewControl: UICollectionView!
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var procedureText: UILabel!
//    var pickComplete : Bool = false
//    var playerArray: [String] = ["player1","player2","player3","player4","player5","player6","player7","player8","player9"]
//    struct assignRole{
//        //let number : Int
//        var pick : Bool
//        var quantity : Int
//        let identity : String
//        init(pick : Bool,quantity : Int,identity : String) {
//            self.pick = pick
//            self.quantity = quantity
//            self.identity = identity
//        }
//    }
//    var rolenumber : Int = 0
//    var wolf = assignRole( pick: true, quantity: 3, identity: "狼人")
//    var prophet = assignRole( pick: false, quantity: 1, identity: "預言家")
//    var witch = assignRole( pick: false, quantity: 1, identity: "女巫")
//    var knight = assignRole( pick: false, quantity: 1, identity: "騎士")
//    var beian = assignRole( pick: false, quantity: 3, identity: "平民")
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        collectionLayout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        collectionLayout.itemSize = CGSize(width: 107, height: 107)
        collectionLayout.scrollDirection = .vertical
        // Do any additional setup after loading the view.
    }
    
    @IBAction func click(_ sender: UIButton) {
        
        print(rolenumber)
        
        if wolf.pick == true {
            wolf.quantity = wolf.quantity - 1
            rolenumber = sender.tag
            if wolf.quantity == 0{
                wolf.pick = false
                
            }
        }
        if prophet.pick == true {
            prophet.quantity = prophet.quantity - 1
            rolenumber = sender.tag
            if prophet.quantity == 0{
                prophet.pick = false
                
            }
        }
        if witch.pick == true {
            witch.quantity = witch.quantity - 1
            rolenumber = sender.tag
            if witch.quantity == 0{
                witch.pick = false
                
            }
        }
        if knight.pick == true {
            knight.quantity = knight.quantity - 1
            rolenumber = sender.tag
            if knight.quantity == 0{
                knight.pick = false
                
            }
        }
        if beian.pick == true {
            beian.quantity = beian.quantity - 1
            rolenumber = sender.tag
            if beian.quantity == 0{
                beian.pick = false
                
            }
        }
    }
    @IBAction func pickwolf(_ sender: Any) {
        if wolf.quantity != 0{
            wolf.pick = true
            prophet.pick = false
            witch.pick = false
            knight.pick = false
            beian.pick = false
        }
        if wolf.pick == true {
            procedureText.text = "請選出\(wolf.identity)"
        }
        if prophet.pick == true {
            procedureText.text = "請選出\(prophet.identity)"
        }
        if witch.pick == true {
            procedureText.text = "請選出\(witch.identity)"
        }
        if knight.pick == true {
            procedureText.text = "請選出\(knight.identity)"
        }
        if beian.pick == true {
            procedureText.text = "請選出\(beian.identity)"
        }
    }
    
    @IBAction func pickprophet(_ sender: Any) {
        if wolf.quantity != 0{
            wolf.pick = false
            prophet.pick = true
            witch.pick = false
            knight.pick = false
            beian.pick = false
        }
        if wolf.pick == true {
            procedureText.text = "請選出\(wolf.identity)"
        }
        if prophet.pick == true {
            procedureText.text = "請選出\(prophet.identity)"
        }
        if witch.pick == true {
            procedureText.text = "請選出\(witch.identity)"
        }
        if knight.pick == true {
            procedureText.text = "請選出\(knight.identity)"
        }
        if beian.pick == true {
            procedureText.text = "請選出\(beian.identity)"
        }
    }
    @IBAction func pickwitch(_ sender: Any) {
        if wolf.quantity != 0{
            wolf.pick = false
            prophet.pick = false
            witch.pick = true
            knight.pick = false
            beian.pick = false
        }
        if wolf.pick == true {
            procedureText.text = "請選出\(wolf.identity)"
        }
        if prophet.pick == true {
            procedureText.text = "請選出\(prophet.identity)"
        }
        if witch.pick == true {
            procedureText.text = "請選出\(witch.identity)"
        }
        if knight.pick == true {
            procedureText.text = "請選出\(knight.identity)"
        }
        if beian.pick == true {
            procedureText.text = "請選出\(beian.identity)"
        }
    }
    @IBAction func pickknight(_ sender: Any) {
        if wolf.quantity != 0{
            wolf.pick = false
            prophet.pick = false
            witch.pick = false
            knight.pick = true
            beian.pick = false
        }
        if wolf.pick == true {
            procedureText.text = "請選出\(wolf.identity)"
        }
        if prophet.pick == true {
            procedureText.text = "請選出\(prophet.identity)"
        }
        if witch.pick == true {
            procedureText.text = "請選出\(witch.identity)"
        }
        if knight.pick == true {
            procedureText.text = "請選出\(knight.identity)"
        }
        if beian.pick == true {
            procedureText.text = "請選出\(beian.identity)"
        }
    }
    @IBAction func pickbeian(_ sender: Any) {
        if wolf.quantity != 0{
            wolf.pick = false
            prophet.pick = false
            witch.pick = false
            knight.pick = false
            beian.pick = true
        }
        if wolf.pick == true {
            procedureText.text = "請選出\(wolf.identity)"
        }
        if prophet.pick == true {
            procedureText.text = "請選出\(prophet.identity)"
        }
        if witch.pick == true {
            procedureText.text = "請選出\(witch.identity)"
        }
        if knight.pick == true {
            procedureText.text = "請選出\(knight.identity)"
        }
        if beian.pick == true {
            procedureText.text = "請選出\(beian.identity)"
        }
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
