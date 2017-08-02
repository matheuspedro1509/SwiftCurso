//
//  MealsTableViewController.swift
//  CursoAluraEx1
//
//  Created by Rodrigo Heleno on 19/07/17.
//  Copyright © 2017 Matheus. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController , AddAMealDelegate {
    
    var meals  = Array<Meal>()
    
    
    func add(_ meal:Meal){
        meals.append(meal)
        
        Dao().save(meals)
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        self.meals = Dao().load()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))
        cell.addGestureRecognizer(longPressRecognizer)
        
        return cell
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addMeal") {
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }

    
    func showDetails(recognizer : UILongPressGestureRecognizer) {
        if (recognizer.state == UIGestureRecognizerState.began) {
            let cell :UITableViewCell = recognizer.view as! UITableViewCell
            
            if  let indexPath = tableView.indexPath(for: cell){
                let row = indexPath.row
                let meal = meals [row]
                
                RemoveMealController(controller: self).show(meal, handler: {action in
                    self.meals.remove(at: row)
                    self.tableView.reloadData()
                })
            }
        }
    }
    
}
