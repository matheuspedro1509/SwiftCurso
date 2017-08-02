//
//  NewItemViewController.swift
//  CursoAluraEx1
//
//  Created by Rodrigo Heleno on 21/07/17.
//  Copyright © 2017 Matheus. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {

    var delegate : AddAnItemDelegate?
    
    init(delegate: AddAnItemDelegate){
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    @IBOutlet var txfName: UITextField?
    
    @IBOutlet var txfCalories: UITextField?
    
    
    @IBAction func addnewItem(){
        
        let name = txfName!.text
        let calories = Double(txfCalories!.text!)
        
        if (name == nil) || (calories == nil) || (delegate == nil){
            return
        }
        let item = Item(name: name!, calories: calories!)
        delegate!.add(item)
        
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
}
