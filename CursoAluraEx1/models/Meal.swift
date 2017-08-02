//
//  Meal.swift
//  CursoAluraEx1
//
//  Created by Rodrigo Heleno on 19/07/17.
//  Copyright © 2017 Matheus. All rights reserved.
//

import Foundation

class Meal : NSObject,NSCoding{
    let name: String
    let happiness: Int
    let items : Array<Item>
    
    init(name:String,happiness:Int, items: Array<Item> = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
     required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.happiness = aDecoder.decodeInteger(forKey: "happiness")
        self.items = aDecoder.decodeObject(forKey: "items") as! Array
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(happiness, forKey: "happiness")
        aCoder.encode(items, forKey: "items")
        
    }
    
    func allCalories() -> Double {
        var total = 0.0
        
        for i in items {
            total += i.calories
        }
        return total
    }
    
    func details() -> String {
        var message = "Happiness: \(happiness)"
        for item in items{
            message += ",\n \(item.name) - calories: \(item.calories)"
        }
        return message
    }
    
}
