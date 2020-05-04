//
//  SecondViewController.swift
//  BMICalculator
//
//  Created by Bryan Dang on 5/1/20.
//  Copyright © 2020 Bryan Dang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create a new constant called label and initialize a new UILabel object from the UILabel class
        let label = UILabel()
        label.text = "Hello"
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)//establish the size and location of the label
        //CGRect = Core Graphics Rectangle
    }
}
