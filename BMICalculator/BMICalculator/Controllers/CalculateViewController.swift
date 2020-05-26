//
//  ViewController.swift
//  BMICalculator
//
//  Created by Bryan Dang on 4/26/20.
//  Copyright © 2020 Bryan Dang. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
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
    
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        performSegue(withIdentifier: "goToResult", sender: self)
        
        }
    
        //must prepare for the 'performSegue' call
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            //use if statement to check segue identifier, if multiple seques are linked
            if segue.identifier == "goToResult" {
                let destinationVC = segue.destination as! ResultsViewController
                //segue.destination will be the view controller that get initialized when the segue gets triggered. 'destination' is of type UIViewController
                //as! ResultsViewController set 'destinationVC' from type UIViewController to ResultsViewController which makes bmiValue accessible.
                // 'as!' is a forced downcast from UIViewController to ResultsViewController
                destinationVC.bmiValue = calculatorBrain.getBMIValue()
                destinationVC.advice = calculatorBrain.getAdvice()
                destinationVC.color = calculatorBrain.getColor()
            }
        }
    }
//        //create object from second view controller.
//        let secondVC = ResultsViewController() //initializing second view controller
//        secondVC.bmiValue = String(format: "%.1f", bmi)
//        //casting string to float, rounding down 1 decimal place
//        //tap into current view controller using the 'self' keyword, present second controller with animation
//        self.present(secondVC, animated: true, completion: nil) // completion is nil, once the animation and presentation are done, i don't want to do anything else
    
    

