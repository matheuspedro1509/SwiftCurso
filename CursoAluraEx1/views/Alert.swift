//
//  Alert.swift
//  CursoAluraEx1
//
//  Created by Rodrigo Heleno on 25/07/17.
//  Copyright © 2017 Matheus. All rights reserved.
//

import UIKit


class Alert{
    
    let controller : UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(_ title:String = "Sorry", message: String = "Unexpected error"){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: "Understood", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
}
