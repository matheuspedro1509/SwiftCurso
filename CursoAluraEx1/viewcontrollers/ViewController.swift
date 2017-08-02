//
//  ViewController.swift
//  CursoAluraEx1
//
//  Created by Rodrigo Heleno on 17/07/17.
//  Copyright © 2017 Matheus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource
        ,UITableViewDelegate , AddAnItemDelegate{
    
    @IBOutlet var txfName : UITextField?
    
    @IBOutlet var txfHappiness : UITextField?
    
    var delegate: AddAMealDelegate?
    
    var selected = Array<Item>()
    
    var items = [
            Item(name: "Eggplant", calories: 10),
            Item(name: "Brownie", calories: 10),
            Item(name: "Zucchini", calories: 10),
            Item(name: "Chocolate", calories: 25),
            Item(name: "Ovo", calories: 20),
            Item(name: "Leite condensado", calories: 70)
    ]
    
    @IBOutlet var tableView : UITableView?
    
    
    func add(_ item: Item) {
        items.append(item)
        Dao().save(items)
        
        if let table = tableView{
            table.reloadData()
        }else{
            Alert(controller: self).show(message: "Unnable to update items table")
        }
    }
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "Novo item", style: UIBarButtonItemStyle.plain, target: self, action: #selector(showNewItem))
        navigationItem.rightBarButtonItem = newItemButton
        
        self.items = Dao().load()
    }

    
    func showNewItem()  {
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController{
            navigation.pushViewController(newItem, animated: true)
        }else{
            Alert(controller: self).show()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = item.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(items[0] == items[1])
        if let cell = tableView.cellForRow(at: indexPath){
            if (cell.accessoryType == UITableViewCellAccessoryType.none) {
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
                let item = items[indexPath.row]
                selected.append(item)
            }else{
                cell.accessoryType = UITableViewCellAccessoryType.none
                let item  = items[indexPath.row]
                if let position = selected.index(of: item){
                    selected.remove(at: position)
                }else{
                    Alert(controller: self).show()
                }
            }
        }else{
            Alert(controller: self).show()
        }
    }
    
    func convertToInt(_ text: String?) -> Int? {
        if let number = text {
            return Int(number)
        }
        return nil
    }
    
    func getMealFromform() -> Meal? {
        if let name = txfName?.text {
            if let happiness = convertToInt(txfHappiness?.text){
                let meal = Meal(name: name, happiness: happiness, items : selected)
                
                print("eaten \(meal.name) with happiness \(meal.happiness) with \(meal.items)")
                
                return meal
            }
        }
        return nil
    }
    
    
    @IBAction func add() {
        if let meal = getMealFromform(){
            if let meals = delegate{
                meals.add(meal)
                if let navigation = navigationController{
                    navigation.popViewController(animated: true)
                    return
                }else{
                    Alert(controller:self).show(message: "Unable to go back, but the meal was added.")
                }
                return
            }
        }
        Alert(controller: self).show()
    }


}

