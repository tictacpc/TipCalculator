//
//  ViewController.swift
//  tipCalculator
//
//  Created by PC on 9/15/16.
//  Copyright © 2016 PC. All rights reserved.
//

import UIKit

var common:CommonFunc = CommonFunc()

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        tipControl.selectedSegmentIndex = common.getPositionCurrent()
        common.setUpdatePosition(tipControl.selectedSegmentIndex)
        updataViewCalculate()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        
        updataViewCalculate()
    }
    
    @IBAction func changePercentControl(sender: AnyObject) {
        common.setPositionSave(tipControl.selectedSegmentIndex)
        updataViewCalculate()
    }
    
    func updataViewCalculate(){
        
        common.setUpdatePosition(tipControl.selectedSegmentIndex)
        let val = common.getResult(billField)
        
        tipLabel.text = val.tip
        totalLabel.text = val.total
    }

}

