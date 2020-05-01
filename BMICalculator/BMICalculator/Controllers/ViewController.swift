//
//  ViewController.swift
//  BMICalculator
//
//  Created by Bryan Dang on 4/26/20.
//  Copyright © 2020 Bryan Dang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.0f", sender.value)
        //how you want to format, what you want to format
        heightLabel.text = "\(height)\""
        //set formated string height to label and append double quote for inches
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        
        weightLabel.text = "\(weight)lbs"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
    
        print((weight * 703)/pow(height, 2))
    
    }
    
}

