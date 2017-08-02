//
//  Item.swift
//  CursoAluraEx1
//
//  Created by Rodrigo Heleno on 19/07/17.
//  Copyright © 2017 Matheus. All rights reserved.
//

import Foundation

class Item : NSObject, NSCoding{
    
    let name : String
    let calories : Double
    
    init(name:String,calories:Double) {
        self.calories = calories
        self.name = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.calories = aDecoder.decodeDouble(forKey: "calories")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(calories, forKey: "calories")
    }
}
func ==(first:Item, second:Item) -> Bool{
    return first.name == second.name && first.calories == second.calories
}
