//
//  ResultsViewController.swift
//  BMICalculator
//
//  Created by Bryan Dang on 5/5/20.
//  Copyright © 2020 Bryan Dang. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var bmiValue: String? //set as an optional string because, initially, when I create my resultsViewController, I don't know what the BMI value is going to be. Its only once I calculated the BMI, then I can actually pass it over.

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmiValue
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil) //play animation of screen closing, nil to not do anything else
    }
    
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
