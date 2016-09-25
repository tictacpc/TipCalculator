//
//  Common.swift
//  tipCalculator
//
//  Created by PC on 9/23/16.
//  Copyright © 2016 PC. All rights reserved.
//

import Foundation
import UIKit

class CommonFunc {
    
    private let KEY_CURRENT_POSITION:String = "positionTipCurrent"
    private let tipPercentages = [0.18, 0.2, 0.25]
    
    private var posTipControl: Int = 0

    func getResult(billField:UITextField) -> (tip:String, total:String){
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[posTipControl]
        let total = bill + tip
        
        return (String(format: "$%.2f",tip),
                String(format: "$%.2f", total)
        )
    }
    
    func setUpdatePosition(newUpdate:Int){
        posTipControl = newUpdate
    }
    
    func setPositionSave(newUpdate:Int){
        setUpdatePosition(newUpdate)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(newUpdate, forKey: KEY_CURRENT_POSITION)
        defaults.synchronize()
    }
    
    func getPositionCurrent()->Int{
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let currentSelect = defaults.objectForKey(KEY_CURRENT_POSITION) as? Int{
            posTipControl = currentSelect
        }
        return posTipControl
    }
    
    func getPostTip()->Int{
        return posTipControl
    }
    
}