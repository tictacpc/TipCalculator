//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by PC on 9/17/16.
//  Copyright © 2016 PC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var percentSet: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        percentSet.selectedSegmentIndex = common.getPostTip()
    }

    @IBAction func changePercent(sender: AnyObject) {
        common.setPositionSave(percentSet.selectedSegmentIndex)
    }
    
}
